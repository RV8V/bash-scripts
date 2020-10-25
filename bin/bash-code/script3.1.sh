#!/bin/bash

#   use only one parameter

# echo -n "enter your name: "
# read name
# echo hello $name

#   use several parameters

# read -p "enter your full name: " first second
# echo "hello, $first"
# echo "hi, $second"

# read -p "enter your name and surname: "
# for value in $REPLY; do echo $value; done

# counter=1
# cat data | while read line
# do
# 	echo "line #$counter is $line"
# 	counter=$(($counter+1))
# done

counter=1
cat data | while read line; do echo "current line #$counter: $line "; done > result  

# if [ $# -eq 0 ]; then
#	echo -e "No parameters found"
#	exit 1
# fi

if [[ "${1: -unset}" == "unset" ]]; then
	echo -e "No parameters found"
	echo $1
	exit
fi


while read x; do
	echo $x
done << data 
