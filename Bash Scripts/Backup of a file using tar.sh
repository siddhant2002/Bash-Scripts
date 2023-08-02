#!/bin/bash

# Configuration
backup_directory="/home/admin/Downloads"
source_directory="/home/admin/helio"
backup_filename="backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory not found: $source_directory"
    exit 1
fi

# Check if the backup directory exists, if not create it
if [ ! -d "$backup_directory" ]; then
    mkdir -p "$backup_directory"
fi

# Create the backup
tar -czvf "$backup_directory/$backup_filename" "$source_directory"

echo "Backup created: $backup_directory/$backup_filename"

