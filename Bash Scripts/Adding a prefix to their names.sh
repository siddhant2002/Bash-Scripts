#!/bin/bash

directory="/home/admin/scripts/tiki"

if [ ! -d "$directory" ]; then
    echo "Directory does not exist."
    exit 1
fi

for file in "$directory"/*; do
    if [ -f "$file" ];
    then
        filename=$(basename "$file")
        new_filename=$(echo "$filename" | sed 's/^/new_/')
        mv "$file" "$directory/$new_filename"
        echo "Renamed '$filename' to '$new_filename'"
    fi
done
echo "All files have been renamed."
