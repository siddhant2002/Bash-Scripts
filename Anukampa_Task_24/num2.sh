#!/bin/bash
echo "Enter bucket name"
read name
aws s3 mb s3://$name --region ap-south-1
aws s3 ls
