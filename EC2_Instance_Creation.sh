#!/bin/bash
MyKeyPair="Phal"
Security_Group_Name="Phalguni"

Security_Group_Description="My-Security-Group"

ami_id="ami-072ec8f4ea4a6f2cf"
instance_name="Pagluni"

aws ec2 create-key-pair --key-name "$MyKeyPair" --query 'KeyMaterial' --output text > "$MyKeyPair.pem"

chmod 400 "$MyKeyPair.pem"

aws ec2 describe-key-pairs --key-name "$MyKeyPair"

Security_id=$(aws ec2 create-security-group --group-name "$Security_Group_Name" --description "$Security_Group_Description" --output text)

aws ec2 describe-security-groups --group-ids "$Security_id"
aws ec2 authorize-security-group-ingress --group-id "$Security_id" --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id "$Security_id" --protocol tcp --port 80 --cidr 0.0.0.0/0
instance_id=$(aws ec2 run-instances --image-id "$ami_id" --count 1 --instance-type t2.micro --key-name "$MyKeyPair" --security-group-ids "$Security_id"  --query 'Instances[0].InstanceId' --output text)


aws ec2 create-tags --resources "$instance_id" --tags Key=Name,Value=$instance_name
aws ec2 describe-instances

sleep 1m 30s

aws ec2 terminate-instances --instance-ids "$instance_id"

echo "EC2 instance created successfully!"
echo "Instance ID: $instance_id"
echo "Key pair file: $MyKeyPair.pem"