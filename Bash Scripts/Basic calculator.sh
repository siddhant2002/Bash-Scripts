echo "Enter two numbers"
read a
read b

while true;
do
echo "Press 1 for addition of two numbers"
echo "Press 2 for subtraction of two numbers"
echo "Press 3 for multiplication of two numbers"
echo "Press 4 for division of two numbers"
echo "Press 5 to exit"
read ch
case $ch in
1) sum=$(echo "$a + $b" | bc -l)
echo "The addition of $a and $b is $sum";;
2) sub=$(echo "$a - $b" | bc -l)
echo "The subtraction of $a and $b is $sub";;
3) mul=$(echo "$a * $b" | bc -l)
echo "The multiplication of $a and $b is $mul";;
4) div=$(echo "$a / $b" | bc -l)
echo "The division of $a and $b is $div";;
5) break;;
*) echo "Invalid choice. Please enter a valid option.";;
esac
done
