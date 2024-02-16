from datasets import load_dataset
import json

def download_dataset_to_jsonl(dataset_name, path_to_save):
    # Load the dataset
    dataset = load_dataset(dataset_name)
    
    # Assuming you want to save the 'train' split, change this if needed
    split = 'train'
    data = dataset[split]

    # Save the data to a .jsonl file
    count = 0
    with open(path_to_save, 'w') as f:
        for item in data:
            json_line = json.dumps(item)
            f.write(json_line + '\n')
            count += 1
    print(f"-------total files downloaded: {count}---------")

if __name__ == "__main__":
    dataset_name = "metareflection/dafny-github-scrape"
    path_to_save = "../dafny_github_scrape.jsonl"  # Adjust path as needed
    download_dataset_to_jsonl(dataset_name, path_to_save)
    print(f"Dataset saved to {path_to_save}")

