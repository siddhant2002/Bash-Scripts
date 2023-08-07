#!/bin/bash
echo "Enter 3 numbers"
read a
read b
read c
if [ $a -gt $b ];
then
if [ $a -gt $c ];
then
echo $a "is the greatest of all numbers"
else
echo $c "is the greatest of all numbers"
fi
else
if [ $b -gt $c ];
then
echo $b "is the greatest of all numbers"
else
echo $c "is the greatest of all numbers"
fi
fi
