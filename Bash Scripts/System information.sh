#!/bin/bash

# Function to print horizontal line
function print_horizontal_line {
    echo "--------------------------------------------------"
}

# Function to print system information
function print_system_info {
    echo "System Information:"
    print_horizontal_line
    echo "Hostname: $(hostname)"
    echo "Kernel Version: $(uname -r)"
    echo "Operating System: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d= -f2 | tr -d \")"
    echo "CPU Info:"
    lscpu | grep "Model name"
    echo "Total RAM: $(free -h | awk '/^Mem:/ {print $2}')"
    echo "Storage (ROM) Information:"
    df -h
    print_horizontal_line
}

# Call the function to print system information
print_system_info

