#!/bin/bash -x

echo "*************************ArithmaticComputation*************************"

# THREE INPUTS FOR PERFORMING OPERATIONS
read -p "Enter first number input: " firstnumber
read -p "Enter second number input: " secondnumber
read -p "Enter third number input: " thirdnumber

# ARITHMETIC OPERATION
Operation1=`echo "scale=2; $firstnumber + $secondnumber * $thirdnumber" | bc`
Operation2=`echo "scale=2; $firstnumber * $secondnumber + $thirdnumber" | bc`
Operation3=`echo "scale=2; $thirdnumber + $firstnumber / $secondnumber" | bc`
Operation4=`echo "scale=2; $firstnumber % $secondnumber + $thirdnumber" | bc`

# DISPLAY OPERATION
echo "Operations Output: " $Operation1 $Operation2 $Operation3 $Operation4

# STORE IN DICTIONARY
declare -A arithmetic
arithmetic[1]="$Operation1"
arithmetic[2]="$Operation2"
arithmetic[3]="$Operation3"
arithmetic[4]="$Operation4"

# DISPLAY DICTIONARY INTO ARRAY
length=${#arithmetic[@]}
echo $length
for (( index=0; index<$length; index++ ))
do
	resultArray[index]=${arithmetic[$((index+1))]}
done
echo ${resultArray[@]}

# SORT IN DESCENDING ORDER
for (( index1=0; index1<$length; index1++ ))
do
	for (( index2=0; index2<$length-1; index2++ ))
	do
		if (($(echo "${resultArray[index2]} < ${resultArray[index2+1]}" | bc -l)))
		then
			temporary=${resultArray[index2]}
			resultArray[index2]=${resultArray[index2+1]}
			resultArray[index2+1]=$temporary
		fi
	done
done
echo "Descending values are " ${resultArray[@]}
