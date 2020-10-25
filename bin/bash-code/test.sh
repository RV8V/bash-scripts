#!/bin/bash

for var in $(cat file); do
	echo $var
done

# loop in shell 'bash'

for (( a=0; a<=3; a++ )); do
      echo number $a
done      

# loop 'while'

var=5
while [ $var -gt 0 ]; do 
	echo $var
	var=$[ $var-1 ]
done

# nested loops

for (( a=0; a<=3; a++ )); do
	echo start $a
	for (( b=0; b<=3; b++ )); do
		echo ineer loop: $b
	done
done

# example of nested loops

IFS=$'\n'
for entry in $(cat /etc/passwd); do
	echo current user account $entry
	IFS=:
	for value in $entry; do
		echo $value
	done
done

# 'break' in loops: 'for' and 'while'

for i in 1 2 3 4 5 6 7 8 9 10; do
	if [ $i -eq 5 ]; then
		break
	fi
	echo current saved state is: $i
done

echo $'\n'

value=1
while [ $value -lt 10 ]; do
	if [ $value -eq 5 ]; then
		break
	fi
	echo current state of variable is: $value
	value=$(($value+1))
done

# 'continue in loops: 'for' and 'while'

echo $'\n'

for (( c=0; c<10; c++ )); do
	if [ $c -eq 4 ] || [ $c -gt 8 ]; then
		echo value that has to be passed: $c
		continue
	fi
	echo iteration number: $c
done

# example of practical case

current=10
while [ $current -ne 1 ]; do
	echo value: $current
	current=$(($current-1))
done > data
echo finished

# find executable files

IFS=:
for folder in $PATH; do
	echo "$folder:"
	for file in $folder/*; do
		if [ -x $file ]; then
			echo file: $file is executable
		else
			echo file: $file is not executable
		fi
	done
done
