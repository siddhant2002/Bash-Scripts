#!/bin/bash

input_file="input.txt"
output_file="output.txt"

if [ ! -f "$input_file" ]; then
    echo "Input file not found."
    exit 1
fi

while IFS= read -r line; do
    modified_line=$(echo "$line" | sed 's/old/new/g')
    echo "$modified_line" >> "$output_file"
done < "$input_file"

echo "Replacement complete. Modified content saved in $output_file."