#!/bin/bash -x

echo "*************************ArithmaticComputation*************************"

# THREE INPUTS FOR PERFORMING OPERATIONS
read -p "Enter first number input: " firstnumber
read -p "Enter second number input: " secondnumber
read -p "Enter third number input: " thirdnumber

# ARITHMETIC OPERATION
Operation1=$(( $firstnumber + $secondnumber * $thirdnumber ))
Operation2=$(( $firstnumber * $secondnumber + $thirdnumber ))
Operation3=`echo "scale=2; $thirdnumber + $firstnumber / $secondnumber" | bc`
Operation4=`echo "scale=2; $firstnumber % $secondnumber + $thirdnumber " | bc`

# DISPLAY OPERATION
echo "Operations Output: " $Operation1 $Operation2 $Operation3 $Operation4 

# STORE IN DICTIONARY
declare -A arithmetic
arithmetic[1]="$Operation1"
arithmetic[2]="$Operation2"
arithmetic[3]="$Operation3"
arithmetic[4]="$Operation4"



