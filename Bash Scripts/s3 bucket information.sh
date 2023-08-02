#!/bin/bash

# Replace 'your-bucket-name' with the name of your S3 bucket
BUCKET_NAME="chopa231"

# Function to get the total size of objects in the bucket
function get_total_size() {
    aws s3 ls s3://$BUCKET_NAME --recursive --human-readable --summarize | grep "Total Size" | awk '{print $3, $4}'
}

# Function to get the number of objects in the bucket
function get_object_count() {
    aws s3 ls s3://$BUCKET_NAME --recursive | wc -l
}

# Main script
echo "Getting the total size of objects in the bucket..."
TOTAL_SIZE=$(get_total_size)
echo "Total size of all objects in the bucket: $TOTAL_SIZE"

echo "Getting the number of objects in the bucket..."
OBJECT_COUNT=$(get_object_count)
echo "Number of objects in the bucket: $OBJECT_COUNT"

