#!/bin/bash

directory="/home/admin/scripts/tiki/day1"
lines=0

for file in "$directory"/*.txt; do
    if [ -f "$file" ]; then
        lines=$(awk 'END {print NR}' "$file")
        lines=$((lines + lines))
    fi
done

echo "Total number of lines across all .txt files: $lines"
