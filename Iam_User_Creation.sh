#! /bin/bash
# Checking if access key is setup in your system
if ! grep -q aws_access_key_id ~/.aws/config; then      # grep -q  Turns off Writing to standard output
   if ! grep -q aws_access_key_id ~/.aws/credentials; then
      echo "AWS config not found or CLI is not installed"
      exit 5
    fi
fi
# read command will prompt you to enter the name of IAM user you wish to create 
read -r -p "Enter the username to create": username
# Using AWS CLI Command create IAM user 
aws iam create-user --user-name "${username}" --output json
# Here we are creating access and secret keys and then using query and storing the values in credentials
credentials=$(aws iam create-access-key --user-name "${username}" --query 'AccessKey.[AccessKeyId,SecretAccessKey]'  --output text)
# cut command formats the output with correct coloumn.
access_key_id=$(echo ${credentials} | cut -d " " -f 1)
secret_access_key=$(echo ${credentials} | cut --complement -d " " -f 1)
# echo command will print on the screen

export chopu=$(aws iam list-policies --query 'Policies[?PolicyName==`AmazonEC2FullAccess`].{ARN:Arn}' --output text)
aws iam attach-user-policy --user-name "${username}" --policy-arn $chopu
export chopu=$(aws iam list-policies --query 'Policies[?PolicyName==`AmazonS3FullAccess`].{ARN:Arn}' --output text)
aws iam attach-user-policy --user-name "${username}" --policy-arn $chopu
export chopu=$(aws iam list-policies --query 'Policies[?PolicyName==`AmazonVPCFullAccess`].{ARN:Arn}' --output text)
aws iam attach-user-policy --user-name "${username}" --policy-arn $chopu
export chopu=$(aws iam list-policies --query 'Policies[?PolicyName==`AdministratorAccess`].{ARN:Arn}' --output text)
aws iam attach-user-policy --user-name "${username}" --policy-arn $chopu
aws iam list-attached-user-policies --user-name "${username}"
echo "IAM user created successfully"
