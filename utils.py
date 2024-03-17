import os
import re


helper_functions = "\nfunction abs(a: real) : real {if a>0.0 then a else -a}\n"


def is_doc(line):
    if line.startswith("/*") or line.startswith("//"):
        return True
    return False


def extract_code_from_llm_output(reply):
    i = reply.find("<answer>")
    if i != -1:
        reply = reply[i + 8 :]
        i = reply.find("</answer>")
        reply = reply[:i]
        return reply
    i = reply.find("```dafny")
    if i != -1:
        reply = reply[i + 8 :]
        i = reply.find("```")
        reply = reply[:i]
        return reply
    i = reply.find("```Dafny")
    if i != -1:
        reply = reply[i + 8 :]
        i = reply.find("```")
        reply = reply[:i]
        return reply
    i = reply.find("```")
    if i != -1:
        reply = reply[i + 3 :]
        i = reply.find("```")
        reply = reply[:i]
        return reply
    return reply


def extract_body(lines, oneline=True):
    body = ""
    start = False
    for line in lines:
        if (
            line.strip().startswith("method")
            or line.strip().startswith("returns")
            or line.strip().startswith("function")
        ):
            body += line + "\n"
            continue
        if "include" in line or is_doc(line):
            continue
        if line.strip() == "{":
            start = True
        if not start:
            continue
        if oneline:
            body += line
        else:
            body += line + "\n"
    return body


def dump_tmp_file(program):
    import time

    timestamp = time.time()
    tmp_dir = "tmp"
    os.makedirs(tmp_dir, exist_ok=True)
    tmp_file = f"{tmp_dir}/tmp_dafny_input_{timestamp}.dfy"
    with open(tmp_file, "w") as f:
        f.write(program)
    return tmp_file


def mask_file_names(text):
    # Define a pattern to match file paths
    file_path_pattern = re.compile(r"\b[\w/_/.]+\.dfy\b")
    # Replace all occurrences of file paths with 'foo.dfy'
    masked_text = file_path_pattern.sub("foo.dfy", text)
    return masked_text


def compile_dafny(body, dafny_path):
    import subprocess

    program = body + helper_functions

    tmp_file = dump_tmp_file(program)
    try:
        result = subprocess.run(
            f"{dafny_path} /compile:0 /noVerify /deprecation:0  {tmp_file}",
            shell=True,
            capture_output=True,
        )

    except Exception as e:
        return str(e)
    return mask_file_names(str(result.stdout))


def no_compile_error(msg: str):
    return "Dafny program verifier did not attempt verification" in msg
