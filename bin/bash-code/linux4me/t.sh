#!/bin/bash

var=`eval date +%s`
echo $var

echo `date +%j`

variable=test

{
  read line1
  read line2
} < /etc/passwd

{
  echo "hello world"
} > "$variable" 

echo $line1 $line2 $variable

echo $'\n'

args=$#
echo ${!args}

variable_=$1_
variable=${variable_/_/}
echo $variable


until [ -z $1 ]; do echo $1; shift; done
echo $'\n'

[ : > file.txt ] && echo okay

echo $'\n'

number=0
number=$((number+1))
echo $number
let "humber = number + 1"
echo $number
: $((number = $number+1))
echo $number
: $[number = $number+1]

echo $number

for i in `seq 0 5`
do
	echo "BASH_VERSINFO[$i] = ${BASH_VERSINFO[$i]}"
done	

