import os
import argparse


def remove_anno(input_file_path):
    dataset_dir = os.path.dirname(os.path.dirname(input_file_path))
    no_anno_keep_conditions_dir = os.path.join(dataset_dir, "no_anno_keep_conditions")
    os.makedirs(no_anno_keep_conditions_dir, exist_ok=True)
    output_file_path = os.path.join(no_anno_keep_conditions_dir, os.path.basename(input_file_path).split('.')[0] + "_no_anno.dfy")

    anno_keywords = ["assert", "invariant", "decreases"]
    statement_end_chars = [';', '{', '}']

    with open(input_file_path, 'r') as input_file:
        lines = input_file.readlines()

    in_ignored_statement = False
    with open(output_file_path, 'w') as output_file:
        for line in lines:
            stripped_line = line.strip()
            if in_ignored_statement:
                # Check if the line contains a statement ending character or keyword at the start
                if any(stripped_line.startswith(keyword) for keyword in anno_keywords) or \
                   any(char in stripped_line for char in statement_end_chars):
                    in_ignored_statement = False
                else:
                    continue  # Skip writing the line

            if not in_ignored_statement:
                # Check if the line starts with any keyword, which indicates the start of a statement to ignore
                if any(stripped_line.startswith(keyword) for keyword in anno_keywords):
                    in_ignored_statement = True
                    continue  # Skip writing the line

                output_file.write(line)  # Write the line if not in an ignored statement


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Remove annotations from a Dafny program")
    parser.add_argument("--input", help="Path to input file")
    args = parser.parse_args()
    remove_anno(args.input)
