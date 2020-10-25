#!/bin/bash

# function myfunc {
#	echo "this is example of using a function"
# }

# function myfunc {
# 	echo "I have overide function 'myfunc'"
# }

# count=1
# while [ $count -le 3 ]
# do
#	myfunc
#	count=$(($count+1))
# done

# cho "this is the end of the loop"
# myfunc
# echo "end of the script"

### example of functions and 'return' ###

# function func {
#	read -p "enter a value " value
#	echo "we add your entered value"
#	return $(($value+10))
# }

# func
# echo "The new value is $?"

# function func {
#	read -p "enter please your value: " value
#	echo $(($value+20))
# }

# result=$(func)
# echo "the value is $result"

### nest example of functions ###

#function add {
#	if [ $# -eq 0 ] || [ $# -gt 2 ]
#	then
#		echo -1
#	elif [ $# -eq 1 ]
#	then
#		echo $(($1+$1))
#	else
#		echo $(($1+$2))
#	fi
# }

# echo -n "adding 10 and 15: "
# echo $(add 10 15)

# echo -n "adding one number: "
# echo $(add 10)

# echo -n "add no numbers: "
# echo $(add)

# echo -n "add 3 numbers: 1 2 3: "
# echo $(add 1 2 3)

### value is declared globally so that we can use it
### without returning it from function
### in function we only change its value

#function func {
#	value=$(($value+10))
#	return $value
# }

# read -p "enter a value: " value
# func
# echo $?

# echo "the new value is: $value"

### local variables use ###

# tmp=4

# function func {
#	local tmp=$[$tmp+10]
#	# echo "tmp value in function scope: $tmp"
#	echo $tmp
# }

# result=$(func)
# echo "\$tmp is $tmp"
# echo "result is $result"

######### next example #########

#function func {
#	echo "The parameters are: \$@    $@"
#	echo "The parametrs are: \$*     $*"

###     here $1 and $@ and $* is the same      ###

#	local arr=$1
#	echo "The received array is: ${arr[*]}"
# }

# myarray=(1 2 3 4 5)
# echo "The original array is: ${myarray[*]}"
# func $myarray


#### some code to test arrays in bash  ####


array=(1 2 3 4 5 6)
# echo "value in array ${array[*]}"

# echo $'\n'

# for value in ${array[*]}
# do
#	echo "current value is $value"
#done

echo $'\n'

#### for i in (1 2 3 4 5 6) we can not do this  ####
#### for i in ${arry[*]} like that we can do    ####

# for element in (1 2 3 4 5 6)
# do
#	echo element: $element
# done	



#### some code to test arrays in bash  ####

# function fn {
#	echo "all parameters: $@"
#	local array=("$@")
#	echo "first parameter: $1"
#	echo "first parameter: $2"
#       echo "first parameter: $3"
#	echo "gathered paramenter: ${array[*]}"
#}

# myarray=(1 2 3)
# fn $myarray

. ./library.sh
result=$(addnum 10 20)
echo "The result is $result"

