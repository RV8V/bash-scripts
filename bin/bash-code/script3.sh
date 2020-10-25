#!/bin/bash

# passed parameters needs to be checked for existence

if [ -n "$1" ]
then
	echo hello "$1", how do you do
else
	echo enter your name
fi

echo $'\n'

echo There were $# parameters passed to this script
echo The last parameter is: ${!#}

echo $'\n'

# difference between '$*' and '$@'

echo "Using the \$* method: $*"
echo "Using the \$@ method: $@"

echo $'\n'

# $* and "$*" is totally different in example below

count=1
for param in "$*"       # change "$*" on $* and the result is different
do
	echo "\$* parameter #$count = $param"
	count=$(($count+1))
done

# next example but using $@

echo $'\n'

value=1
for param in "$@"
do
	echo "\$@ parameter #$value = $param"
	value=$[$value+1]
done

# use 'shift' for 'to go for parameters in command line'

echo $'\n'

counter=1
while [ -n "$1" ]
do
	echo "current parameter is: #$counter = $1"
	counter=$(($counter+1))
	shift
done


