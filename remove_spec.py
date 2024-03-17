import os
import argparse


def remove_spec(input_file_path):
    dataset_dir = os.path.dirname(os.path.dirname(input_file_path))
    no_spec_dir = os.path.join(dataset_dir, "no_spec")
    os.makedirs(no_spec_dir, exist_ok=True)
    output_file_path = os.path.join(no_spec_dir, os.path.basename(input_file_path).split('.')[0] + "_no_spec.dfy")

    spec_keywords = ["requires", "ensures", "assert", "invariant", "modifies", "reads", "decreases"]
    statement_end_chars = [';', '{', '}']

    with open(input_file_path, 'r') as input_file:
        lines = input_file.readlines()

    in_ignored_statement = False
    with open(output_file_path, 'w') as output_file:
        for line in lines:
            stripped_line = line.strip()
            if in_ignored_statement:
                # Check if the line contains a statement ending character or keyword at the start
                if any(stripped_line.startswith(keyword) for keyword in spec_keywords) or \
                   any(char in stripped_line for char in statement_end_chars):
                    in_ignored_statement = False
                else:
                    continue  # Skip writing the line

            if not in_ignored_statement:
                # Check if the line starts with any keyword, which indicates the start of a statement to ignore
                if any(stripped_line.startswith(keyword) for keyword in spec_keywords):
                    in_ignored_statement = True
                    continue  # Skip writing the line

                output_file.write(line)  # Write the line if not in an ignored statement


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Remove specifications from a Dafny program")
    parser.add_argument("--input", help="Path to input file")
    args = parser.parse_args()
    remove_spec(args.input)
