#!/bin/bash
echo "Enter the package name to be installed"
read package_name
if command -v $package_name >/dev/null 2>&1;
then
echo "Package is already installed"
exit
else
sudo apt update
sudo apt install -y $package_name
fi
