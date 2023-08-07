#!/bin/bash
echo "Enter the size of the list"
read size
echo "Enter" $size "Numbers "
sum=0
for (( i=1; i<=$size; i++ ));
do
read num
sum=$((sum+num))
done
echo "The sum is " $sum
