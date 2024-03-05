import os

def delete_files_starting_with_clover(directory):
    for filename in os.listdir(directory):
        if filename.startswith("Clover"):
            file_path = os.path.join(directory, filename)
            try:
                os.remove(file_path)
                print(f"Deleted {file_path}")
            except Exception as e:
                print(f"Error deleting {file_path}: {e}")

# Specify the directory to search
if __name__ == "__main__":
    directory = 'compilable/'
    delete_files_starting_with_clover(directory)

