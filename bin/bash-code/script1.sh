#!/bin/bash

# we can use command 'echo' without double quotes ""
# \$1 we want to print $1 as it is 
echo hello world $1
echo hello world \$1

# the same result (without "" and with double quotes)
echo $HOME
echo "$HOME"

# the same result for user variables
# they are alive while script is being processed
# instead of system variables
string=jelly
str='jelly'
echo $str $string

# example with if-then construction
# variables are used in expressions in format $var
# but commands used as they are

if pwd; then
	echo hello
fi	

# find user in all users in our system
# (means 'find user account in all account in the system)

user='postgres'

if grep $user /etc/passwd; then
	echo user $user exists in system
fi

# expression in 'if' statement should be enclosed in '[ ]'

if [ 6 -ne 10 ]; then
        echo cool	
else
	echo not bad too
fi

# compare strings
# -n str1  return true if lenght > 0
# -z str1  return true if lenght = 0
# str1 = str2  compare strings

username='postgres'
if [ $username = $USER ]; then
	echo user $username exists in home folder
else 
	echo user is not here
fi

# feature with string comparison

val1='hello world'
val2='good morning'

if [ $val1 \> $val2 ]; then
	echo $val1 is greater than $val2
else
	echo reverse
fi

# check different types of file

# -d file  exists and is type directory
# -e file  only check exists 'file' or not
# -f file  exists and is type file
# -r file  exists and file has rights for 'reading'
# -w file  exists and file has rights for 'editing, deleting, moving and so on'
# -x file  exists and file has rights for 'execution'
# -s file  exists and is not empty
# file1 -nt file2  nt means 'newer than' (touch depends on)
# file1 -ot file2  ot means 'older than' (touch depends on)
# -O file  check if exists and this current user is owner of this 'file'
# -G file  check if exists and this current user id corresponds to file group id

file='script1.sh'
if [ -O $file ]; then
	echo true
else
	echo 
fi

