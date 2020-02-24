#!/bin/bash -x

echo "*************************ArithmaticComputation*************************"

# THREE INPUTS FOR PERFORMING OPERATIONS
read -p "Enter first number input: " input1
read -p "Enter second number input: " input2
read -p "Enter third number input: " input3

# ARITHMETIC OPERATION
operation1=`echo "scale=2; $input1 + $input2 * $input3" | bc`
operation2=`echo "scale=2; $input1 * $input2 + $input3" | bc`
operation3=`echo "scale=2; $input3 + $input1 / $input2" | bc`
operation4=`echo "scale=2; $input1 % $input2 + $input3" | bc`

# STORE IN DICTIONARY
declare -A arithmetic
arithmetic[1]="$operation1"
arithmetic[2]="$operation2"
arithmetic[3]="$operation3"
arithmetic[4]="$operation4"

# DISPLAY DICTIONARY INTO ARRAY
length=${#arithmetic[@]}
for (( index=0; index<$length; index++ ))
do
	resultArray[index]=${arithmetic[$((index+1))]}
done

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

# SORT IN ASCENDING ORDER
for (( index1=0; index1<$length; index1++ ))
do
	for (( index2=0; index2<$length-1; index2++ ))
	do
		if (($(echo "${resultArray[index2]} > ${resultArray[index2+1]}" | bc -l)))
		then
			temporary=${resultArray[index2]}
			resultArray[index2]=${resultArray[index2+1]}
			resultArray[index2+1]=$temporary
		fi
	done
done
echo "Ascending values are " ${resultArray[@]}
