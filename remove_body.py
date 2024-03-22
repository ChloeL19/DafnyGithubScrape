import re
import argparse
from collections import defaultdict

def parse_dafny_file(file_path):
    # Regular expression patterns for matching definitions and calls
    definition_pattern = re.compile(r"^(function|method|lemma)\s+(\w+)")
    call_pattern = re.compile(r"\b(\w+)\(")
    
    # Initialize a dictionary to hold dependencies
    dependencies = defaultdict(set)
    # Track the current scope to add dependencies correctly
    current_scope = None

    with open(file_path, 'r') as file:
        for line in file:
            # Match definitions (function, method, lemma)
            def_match = definition_pattern.search(line)
            if def_match:
                current_scope = def_match.group(2)  # The name of the current function/method/lemma
                dependencies[current_scope]  # Ensure the scope is added to the dictionary
                continue
            
            # If within a scope, look for calls
            if current_scope:
                calls = call_pattern.findall(line)
                for call in calls:
                    if call != current_scope:  # Avoid adding self-dependencies
                        dependencies[current_scope].add(call)
    
    return dependencies

def display_dependencies(dependencies):
    for key, value in dependencies.items():
        if value:
            print(f"{key} depends on: {', '.join(value)}")
        else:
            print(f"{key} has no dependencies")

def parse_definitions_and_calls(file_path):
    definition_pattern = re.compile(r"^\s*(function|method|lemma)\s+(\w+)")
    call_pattern = re.compile(r"\b(\w+)\(")
    definitions = {}
    calls = set()

    with open(file_path, 'r') as file:
        content = file.read()
        for match in definition_pattern.finditer(content):
            definitions[match.group(2)] = match.span()
            calls.update(call_pattern.findall(content[match.end():]))

    return definitions, calls

def remove_root_bodies(file_path, definitions, calls):
    root_elements = {name for name in definitions if name not in calls}
    if not root_elements:
        return False  # No changes made

    with open(file_path, 'r') as file:
        content = file.read()

    # Sort root elements by their starting position in reverse
    for name in sorted(root_elements, key=lambda x: definitions[x][0], reverse=True):
        start, end = definitions[name]
        # Find the next function or end of file to determine the end of the body
        body_end_match = re.search(r"^\s*(function|method|lemma)", content[end:], re.MULTILINE)
        if body_end_match:
            body_end = end + body_end_match.start()
        else:
            body_end = len(content)
        content = content[:start] + content[body_end:]

    with open(file_path, 'w') as file:
        file.write(content)

    return True

def clean_file(file_path):
    definitions, calls = parse_definitions_and_calls(file_path)
    if remove_root_bodies(file_path, definitions, calls):
        print(f"Modified {file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Build and display a dependency graph for functions, methods, and lemmas in a Dafny file.")
    parser.add_argument("file_path", help="The path to the Dafny (.dfy) file")
    args = parser.parse_args()

    dependencies = parse_dafny_file(args.file_path)
    display_dependencies(dependencies)
    clean_file(args.file_path)
