#!/bin/bash

if ! command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is not installed. Please install it before running this script."
    exit 1
fi
if [ $# -ne 2 ]; then
    echo "Usage: $0 <local_file_path> <bucket_name>"
    exit 1
fi
local_file_path=$1
bucket_name=$2

if [ ! -f "$local_file_path" ]; then
    echo "Error: The specified local file '$local_file_path' does not exist."
    exit 1
fi

echo "Uploading file '$local_file_path' to S3 bucket '$bucket_name' ..."
aws s3 cp "$local_file_path" "s3://$bucket_name/"

if [ $? -eq 0 ]; then
    echo "File '$local_file_path' uploaded to S3 bucket '$bucket_name' successfully."
else
    echo "Failed to upload file '$local_file_path' to S3 bucket '$bucket_name'. Please check the bucket name and permissions."
fi
