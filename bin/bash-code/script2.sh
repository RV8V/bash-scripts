#!/bin/bash

for var in $(cat file); do
	echo current element is $var
done

# we have the same output in console after execution this script
# 'one' is the same type with world - three - 
# because type in variables in bash are always 'string'

for variable in test $(head file) 'one' 'two' three; do
	echo this is $variable
done

IFS=$'\n'
for i in $(cat /etc/passwd | head); do
	echo $i
done

