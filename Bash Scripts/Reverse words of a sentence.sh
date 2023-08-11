#!/bin/bash

echo "Enter a string:"
read sen

sen=$(echo "$sen" | sed -E 's/([^ ]+)/\1\n/g' | sed '/^\s*$/d' | tac | tr '\n' ' ')
sen=${sen%?}

echo "Reversed sentence:"
echo "$sen"
