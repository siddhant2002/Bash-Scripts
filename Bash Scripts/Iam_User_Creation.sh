#! /bin/bash


if ! grep -q aws_access_key_id ~/.aws/config; then
   if ! grep -q aws_access_key_id ~/.aws/credentials; then
      echo "AWS config not found or CLI is not installed"
      exit 5
    fi
fi


read -r -p "Enter the username to create": username


aws iam create-user --user-name "${username}" --output json


credentials=$(aws iam create-access-key --user-name "${username}" --query 'AccessKey.[AccessKeyId,SecretAccessKey]'  --output text)


access_key_id=$(echo ${credentials} | cut -d " " -f 1)
secret_access_key=$(echo ${credentials} | cut --complement -d " " -f 1)


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