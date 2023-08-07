#!/bin/bash
echo "Enter the file path"
read file_path
number=`wc --lines < $file_path`
echo "Number of lines in the file is " $number
