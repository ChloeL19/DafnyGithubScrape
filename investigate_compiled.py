'''
Iterate through the github_compilable_info.jsonl file and write each compilable file to a separate .dfy file in the
/compile directory.
'''
import json
import os

if __name__ == "__main__":
    with open("github_compilable_info.jsonl", 'r') as infile:
        for line in infile:
            dfile = json.loads(line)
            if dfile["compilable"]:
                # create the .dfy we want to save this to: name is repo/filename
                # write to the .dfy file
                repo_name = dfile["from_repo"]
                file = dfile["file"]
                filename = f"{repo_name}{file}".replace("/", "_")
                with open(f"compilable/{filename}", 'w') as outfile:
                    outfile.write(dfile["content"]+"\n")
        print("Extracted all compilable files!")


