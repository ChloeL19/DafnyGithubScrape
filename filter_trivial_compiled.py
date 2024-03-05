import os

def is_code_line(line, in_block_comment):
    stripped_line = line.strip()
    if stripped_line.startswith('//'):
        return False, in_block_comment
    if stripped_line.startswith('/*'):
        return False, True
    if stripped_line.endswith('*/'):
        return False, False
    if in_block_comment:
        return False, in_block_comment
    return True, in_block_comment

def should_delete_file(file_path):
    in_block_comment = False
    code_lines = 0
    with open(file_path, 'r') as file:
        for line in file:
            is_code, in_block_comment = is_code_line(line, in_block_comment)
            if is_code:
                code_lines += 1
            if code_lines >= 3:
                return False
    return True

def delete_files_with_fewer_than_3_code_lines(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        if os.path.isfile(file_path):
            if should_delete_file(file_path):
                os.remove(file_path)
                print(f"Deleted {file_path}")

# Specify the directory
if __name__ == "__main__":
    directory = 'compilable/'
    delete_files_with_fewer_than_3_code_lines(directory)

