#!/bin/bash


function print_horizontal_line {
    echo "--------------------------------------------------"
}


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


print_system_info

