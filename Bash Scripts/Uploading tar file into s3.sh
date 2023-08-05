#!/bin/bash

function log_name() {
    echo "$(date '+%Y-%m-%d %H-%M-%S') - $1" >> backup.log
}

if [ ! command -v aws >/dev/null 2>&1 ]; then
    log_name "aws not installed.."
    log_name "installing aws.."
    sudo apt update
    sudo apt install -y awscli
fi

log_name "Enter the source directory and bucket name"
if [ $# -ne 2 ]; then
    log_name "Usage: $0 <source_directory> <s3_bucket_name>"
    exit 1
fi


source_dir="$1"

bucket_name="$2"

tarball_name="backup_$(date '+%Y%m%d%H%M%S').tar.gz"

if [ ! -d "$source_dir" ]; then
    log_name "Source directory '$source_dir' does not exist or is not accessible. Aborting backup..."
    exit 1
fi

if ! aws s3 ls "s3://$bucket_name" &>/dev/null; then
    log_name "S3 bucket with the given name doesn't exist."
    backup_directory="/home/admin/Downloads"
else
    backup_directory="."
fi

tar -czvf "$backup_directory/$tarball_name" "$source_dir"

if ! aws s3 cp "$backup_directory/$tarball_name" "s3://$bucket_name/$tarball_name"; then
    log_name "Uploading into the S3 bucket failed"
    rm "$backup_directory/$tarball_name"
    exit 1
fi

rm "$backup_directory/$tarball_name"

log_name "Backing up into the S3 bucket successful"
