#!/bin/bash
BUCKET_NAME="your name"
function get_total_size() {
    aws s3 ls s3://$BUCKET_NAME --recursive --human-readable --summarize | grep "Total Size" | awk '{print $3, $4}'
}


function get_object_count() {
    aws s3 ls s3://$BUCKET_NAME --recursive | wc -l
}


echo "Getting the total size of objects in the bucket..."
TOTAL_SIZE=$(get_total_size)
echo "Total size of all objects in the bucket: $TOTAL_SIZE"

echo "Getting the number of objects in the bucket..."
OBJECT_COUNT=$(get_object_count)
echo "Number of objects in the bucket: $OBJECT_COUNT"