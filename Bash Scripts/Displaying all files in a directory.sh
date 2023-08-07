#!/bin/bash
echo "Enter directory name"
read dir_name
if [ -d $dir_name ]
then
echo "list of files in the directory are"
ls -l $dir_name | egrep '^d'
else
echo "Enter correct directory name"
fi
