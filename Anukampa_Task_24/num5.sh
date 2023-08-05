#!/bin/bash

list_security_groups() {
    aws ec2 describe-security-groups --region "$1"
}
add_inbound_rule() {
    aws ec2 authorize-security-group-ingress \
        --region "$1" \
        --group-id "$2" \
        --protocol "$3" \
        --port "$4" \
        --cidr "$5"
}

remove_inbound_rule() {
    aws ec2 revoke-security-group-ingress \
        --region "$1" \
        --group-id "$2" \
        --protocol "$3" \
        --port "$4" \
        --cidr "$5"
}


echo "AWS Security Group Management Script"
echo "----------------------------------"

read -p "Enter AWS region (e.g., us-east-1): " aws_region

echo "Listing security groups in $aws_region region:"
list_security_groups "$aws_region"

read -p "Enter the ID of the security group to modify: " group_id

while true; do
    echo "----------------------------------"
    echo "1. Add inbound rule"
    echo "2. Remove inbound rule"
    echo "3. Exit"
    read -p "Enter your choice (1/2/3): " choice

    case "$choice" in
        1)
            read -p "Enter protocol (e.g., tcp, udp): " protocol
            read -p "Enter port number: " port
            read -p "Enter the CIDR block (e.g., 0.0.0.0/0): " cidr
            add_inbound_rule "$aws_region" "$group_id" "$protocol" "$port" "$cidr"
            echo "Inbound rule added successfully."
            ;;
        2)
            read -p "Enter protocol (e.g., tcp, udp): " protocol
            read -p "Enter port number: " port
            read -p "Enter the CIDR block (e.g., 0.0.0.0/0): " cidr
            remove_inbound_rule "$aws_region" "$group_id" "$protocol" "$port" "$cidr"
            echo "Inbound rule removed successfully."
            ;;
        3)
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
