#!/bin/bash

if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is already installed."
    exit 0
fi


echo "Installing AWS CLI..."

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y awscli
elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y awscli
else
    echo "Unsupported package manager. Please install the AWS CLI manually."
    exit 1
fi
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI has been installed successfully."
else
    echo "Failed to install AWS CLI. Please check the installation manually."
    exit 1
fi

exit 0
