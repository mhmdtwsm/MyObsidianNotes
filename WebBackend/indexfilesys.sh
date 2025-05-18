#!/bin/bash

# Base notes directory
BASE_DIR=~/Documents/obsidian_git/WebBackend/Git

# Loop over each subdirectory
for dir in "$BASE_DIR"/*/; do
  # Get directory name only (e.g., Branches)
  dirname=$(basename "$dir")

  # Start writing the index file
  index_file="$dir/$dirname.md"
  echo "# Index of $dirname" > "$index_file"
  echo "" >> "$index_file"

  # Loop through all .md files in the directory except index.md
  for file in "$dir"*.md; do
    fname=$(basename "$file" .md)
    # Skip index.md itself
    if [[ "$fname" == "index" ]]; then
      continue
    fi
    # Write link using the custom format
    echo "- [$fname](../$dirname/$fname)" >> "$index_file"
  done
done

echo "Index files created for each folder in $BASE_DIR"

