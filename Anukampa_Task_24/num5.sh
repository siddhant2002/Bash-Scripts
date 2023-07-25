#!/bin/bash

# Function to list all security groups in a specific region
list_security_groups() {
    aws ec2 describe-security-groups --region "$1"
}

# Function to add inbound rule to a security group
add_inbound_rule() {
    aws ec2 authorize-security-group-ingress \
        --region "$1" \
        --group-id "$2" \
        --protocol "$3" \
        --port "$4" \
        --cidr "$5"
}

# Function to remove inbound rule from a security group
remove_inbound_rule() {
    aws ec2 revoke-security-group-ingress \
        --region "$1" \
        --group-id "$2" \
        --protocol "$3" \
        --port "$4" \
        --cidr "$5"
}

# Main script
echo "AWS Security Group Management Script"
echo "----------------------------------"

# Set the AWS region
read -p "Enter AWS region (e.g., us-east-1): " aws_region

# List all security groups in the specified region
echo "Listing security groups in $aws_region region:"
list_security_groups "$aws_region"

# Select a security group by Group ID
read -p "Enter the ID of the security group to modify: " group_id

# Prompt the user to add or remove inbound rules
while true; do
    echo "----------------------------------"
    echo "1. Add inbound rule"
    echo "2. Remove inbound rule"
    echo "3. Exit"
    read -p "Enter your choice (1/2/3): " choice

    case "$choice" in
        1)
            # Add inbound rule
            read -p "Enter protocol (e.g., tcp, udp): " protocol
            read -p "Enter port number: " port
            read -p "Enter the CIDR block (e.g., 0.0.0.0/0): " cidr
            add_inbound_rule "$aws_region" "$group_id" "$protocol" "$port" "$cidr"
            echo "Inbound rule added successfully."
            ;;
        2)
            # Remove inbound rule
            read -p "Enter protocol (e.g., tcp, udp): " protocol
            read -p "Enter port number: " port
            read -p "Enter the CIDR block (e.g., 0.0.0.0/0): " cidr
            remove_inbound_rule "$aws_region" "$group_id" "$protocol" "$port" "$cidr"
            echo "Inbound rule removed successfully."
            ;;
        3)
            # Exit the script
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
