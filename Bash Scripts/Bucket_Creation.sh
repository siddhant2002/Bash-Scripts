#!/bin/bash
echo "Enter bucket name"
read name
aws s3 mb s3://$name
aws s3 ls
