#!/bin/bash

# usual 'while' loop but also here we used 'trap' for interception signal

# trap "echo ' Trapped Ctrl-C'" SIGINT
# echo This is a test script
# count=1
# while [ $count -lt 10 ]
# do
#        echo "loop #$count"
#	sleep 1
#	count=$(($count+1))
# done

# trap "goodbye..." EXIT
# counter=1
# while [ $counter -lt 10 ]
# do
#	echo "current state in loop is: #$counter"
#	sleep 1
# 	counter=$(($counter+1))
# done

# trap "first interceptot is here" SIGINT
#counter=1
#while [ $counter -lt 5 ]
#do
#	echo "loop #$counter"
#	sleep 1
#	counter=$(($counter+1))
#done

# trap "second interceptor is here" SIGINT
# counter=1
# while [ $counter -lt 5 ]
# do
#	echo "second loop started #$counter"
#	sleep 1
#	counter=$(($counter+1))
# done

counter=1
for i in one two three four five
do
	if [ $counter -eq 5 ]
	then
		echo "I am gonna exit" 
		exit 1
	fi
	sleep 10
	echo $i, $counter
	counter=$(($counter+1))
done
