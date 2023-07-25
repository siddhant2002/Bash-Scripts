#!/bin/bash

# Check if the AWS CLI is already installed
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is already installed."
    exit 0
fi

# Install AWS CLI
echo "Installing AWS CLI..."

# Check the package manager (apt or yum)
if command -v apt >/dev/null 2>&1; then
    # Install on Debian/Ubuntu-based systems
    sudo apt update
    sudo apt install -y awscli
elif command -v yum >/dev/null 2>&1; then
    # Install on Red Hat/CentOS-based systems
    sudo yum install -y awscli
else
    echo "Unsupported package manager. Please install the AWS CLI manually."
    exit 1
fi

# Verify the installation
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI has been installed successfully."
else
    echo "Failed to install AWS CLI. Please check the installation manually."
    exit 1
fi

exit 0
