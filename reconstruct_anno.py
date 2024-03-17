import argparse
import os
from typing import Dict, List

import sglang as sgl
from sglang import OpenAI, assistant, gen, set_default_backend, system, user

from sys_prompts import *
from utils import extract_code_from_llm_output, extract_body, compile_dafny, no_compile_error


@sgl.function
def reconstruct_anno(s, body, dafny_path, feedback_turn=3):
    s += system(SYS_DAFNY)
    s += user(GEN_ANNO_FROM_BODY + body)
    body_with_anno = ""

    for i in range(feedback_turn):
        with s.copy() as tmp:
            tmp += assistant(gen("new_body_with_anno"), max_tokens=1024)
            body_with_anno = extract_code_from_llm_output(tmp["new_body_with_anno"])
        body_with_anno = extract_body(body_with_anno.strip().split("\n"), False)
        s += assistant(body_with_anno)
        out = compile_dafny(body_with_anno, dafny_path)

        if no_compile_error(str(out)):
            return True, body_with_anno
        
        with s.user():
            s += "This answer got Dafny compile error:\n" + str(out) + "\n"
            s += "Please try again by taking the Dafny compiler feedback"
    
    return False, body_with_anno


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Reconstruct annotations for a Dafny program")
    parser.add_argument("--test_file", type=str, required=True)
    parser.add_argument("--dafny_path", type=str, required=True)
    args = parser.parse_args()

    set_default_backend(OpenAI("gpt-4-1106"))

    program_path = f"dataset/no_anno/{args.test_file}"
    with open(program_path, "r") as file:
        body = file.read()
    
    success, new_body = reconstruct_anno(system(GEN_ANNO_FROM_BODY), body, args.dafny_path)
    print(success, new_body)
