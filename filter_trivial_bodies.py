import os
import re
import argparse
from collections import defaultdict

def parse_dafny_file(file_path):
    definition_pattern = re.compile(r"^\s*(function|method|lemma)\s+(\w+)")
    
    has_definitions = False

    with open(file_path, 'r') as file:
        for line in file:
            if definition_pattern.search(line):
                has_definitions = True
                break  # No need to continue once we've found a definition
    
    return has_definitions

def clean_directory(directory_path):
    for root, dirs, files in os.walk(directory_path):
        for file in files:
            if file.endswith('.dfy'):
                file_path = os.path.join(root, file)
                has_definitions = parse_dafny_file(file_path)
                
                # Keep the file if it defines at least one function, method, or lemma
                if not has_definitions:
                    os.remove(file_path)
                    print(f"Removed {file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Remove Dafny (.dfy) files without any function, method, or lemma definitions.")
    parser.add_argument("--directory", help="Path to the directory containing Dafny (.dfy) files", default="dataset/ground_truth")
    args = parser.parse_args()

    clean_directory(args.directory)

