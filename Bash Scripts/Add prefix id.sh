#!/bin/bash
input_file="data.txt"
output_file="output.txt"

if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

sed 's/^/ID: /' "$input_file" > "$output_file"
echo "Prefix added to each line and saved to $output_file"
