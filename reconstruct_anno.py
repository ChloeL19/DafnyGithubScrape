import argparse
import os
from typing import Dict, List

import sglang as sgl
from sglang import OpenAI, assistant, gen, set_default_backend, system, user

from sys_prompts import *


@sgl.function
def reconstruct_anno(s, body, dafny_path, feedback_turn=3):
    s += system(SYS_DAFNY)
    s += user(GEN_SPEC_FROM_BODY + body)

    for i in range(feedback_turn):
        with s.copy() as tmp:
            tmp += assistant(gen("new_body_with_spec"), max_tokens=1024)
            body_with_spec = 