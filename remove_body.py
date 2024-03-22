import re
import argparse
import os

def remove_method_bodies(dafny_program_text):
    """
    Removes the bodies of all methods in a Dafny program, replacing them with "/* TODO */".
    
    Args:
    - dafny_program_text (str): The text of the Dafny program.
    
    Returns:
    - str: The Dafny program text with method bodies removed.
    """
    # Improved logic to handle method and lemma bodies, including nested brackets
    #pattern = r"\b(method|lemma)\b\s+[^\{]+\{"
    pattern = r"\b(method|lemma)\b\s+[\s\S]+?\{"
    matches = [(m.start(), m.end()) for m in re.finditer(pattern, dafny_program_text)]
    modified_text = dafny_program_text
    offset = 0

    for start, end in matches:
        depth = 1  # Depth of nested brackets, starting with the opening bracket found
        i = end - offset  # Start searching for the closing bracket from the end of the match

        # Iterate through the text to find the matching closing bracket
        while depth > 0 and i < len(modified_text):
            if modified_text[i] == '{':
                depth += 1
            elif modified_text[i] == '}':
                depth -= 1
            i += 1
        
        # Once the matching closing bracket is found, replace the entire body with "/* TODO */"
        if depth == 0:
            body_start = end - offset  # Adjust for previous replacements
            body_end = i 
            modified_text = modified_text[:body_start] + "/* TODO */ }" + modified_text[body_end:]
            offset += body_end - body_start - len("/* TODO */ }")

    return modified_text

def mod_check(text):
    pattern = r"/\*\s*TODO\s*\*/"

    # Using the re.search() method to search for the pattern in the text
    return re.search(pattern, text)

def get_output_path(original_path):

    # Split the original path into parts
    path_parts = original_path.split('/')

    # Change the directory name in the path
    # Assuming 'ground_truth_body' is always present and needs to be replaced with 'no_body'
    new_path_parts = [part if part != 'ground_truth_body' else 'no_body' for part in path_parts]

    # Join the path back together
    new_path = '/'.join(new_path_parts)
    return new_path

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Build and display a dependency graph for functions, methods, and lemmas in a Dafny file.")
    parser.add_argument("file_path", help="The path to the Dafny (.dfy) file")
    args = parser.parse_args()
    with open(args.file_path, 'r') as file:
        dafny_program_text = file.read()

    # Process the program text
    modified_program_text = remove_method_bodies(dafny_program_text)
    print(modified_program_text)
    
    # Confirm some part of the program has been removed
    if not mod_check(modified_program_text):
        print("WARNING: nothing changed")
        try:
            os.remove(args.file_path)
        except:
            print("Could not remove the file that was unmodified")
    else:
        # TODO: write to outfile path instead
        out_path = get_output_path(args.file_path)
        with open(out_path, 'w', encoding='utf-8') as file:
            file.write(modified_program_text)
