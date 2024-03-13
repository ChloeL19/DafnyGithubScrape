#!/bin/bash

folder_path="/Users/wendysun/Desktop/DafnyGithubScrape/dataset/ground_truth"

rust_script_path="/Users/wendysun/Desktop/DafnyGithubScrape/remove_anno/target/release/remove_anno"

if [ ! -d "$folder_path" ]; then
    echo "Folder does not exist: $folder_path"
    exit 1
fi

for file in "$folder_path"/*; do
    if [ -f "$file" ]; then
        echo "Processing file: $file"
        "$rust_script_path" "$file"
    fi
done

echo "All files processed"
