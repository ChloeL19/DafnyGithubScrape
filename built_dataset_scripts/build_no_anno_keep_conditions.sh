#!/bin/bash

GROUND_TRUTH_DIR="/Users/wendysun/Desktop/DafnyGithubScrape/dataset/ground_truth"

for file in "$GROUND_TRUTH_DIR"/*; do
  filename=$(basename -- "$file")
  python remove_anno_keep_conditions.py --input "$file"
  echo "Processing $file"
done
