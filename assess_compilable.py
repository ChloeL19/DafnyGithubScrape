import subprocess
import tqdm
import json
from execute import execute

num_compiled = 0
with open("dafny_github_scrape.jsonl", 'r') as file:
    count = 0
    for line in file:
        count += 1
        #print(f"Analyzing line {count}")
        if count > 3314:
            line = json.loads(line)
            print(f"Loaded file {count}")
            res = execute("dafny verify", "dfy", line["content"])
            print(f"Executed {count}")
            if int(res["status"]) == 0:
                num_compiled += 1
                line["compilable"] = 1
            else:
                line["compilable"] = 0
            with open("github_compilable_info.jsonl", 'a') as outfile:
                outfile.write(json.dumps(line) + '\n')
print(f"The number of compiled dafny programs in this run: {num_compiled}")
