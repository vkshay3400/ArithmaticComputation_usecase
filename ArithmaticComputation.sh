#!/bin/bash -x

echo "*************************ArithmaticComputation*************************"

# THREE INPUTS FOR PERFORMING OPERATIONS
read -p "Enter first number input: " firstnumber
read -p "Enter second number input: " secondnumber
read -p "Enter third number input: " thirdnumber

# ARITHMETIC OPERATION
Operation1=$(( $firstnumber + $secondnumber * $thirdnumber ))
Operation2=$(( $firstnumber * $secondnumber + $thirdnumber  ))
