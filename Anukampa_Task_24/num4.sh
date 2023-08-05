#!/bin/bash

REGION="ap-south-1"

echo "Listing all running EC2 instances in region $REGION..."
running_instances=$(aws ec2 describe-instances --region $REGION --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

if [ -z "$running_instances" ]; then
  echo "No running EC2 instances found in region $REGION."
else
  echo "Found running instances: $running_instances"
  echo "Stopping instances..."
  aws ec2 stop-instances --region $REGION --instance-ids $running_instances

  echo "Waiting for instances to stop..."
  aws ec2 wait instance-stopped --region $REGION --instance-ids $running_instances

  echo "Starting instances..."
  aws ec2 start-instances --region $REGION --instance-ids $running_instances

  echo "Waiting for instances to start..."
  aws ec2 wait instance-running --region $REGION --instance-ids $running_instances

  echo "All instances are now running."
fi
