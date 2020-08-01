#!/bin/bash

# a todo app that creates a list of tasks based on script parameters and
# allocates time to each task based on 8 working hours
# priority tasks get double the time than normal tasks
# the help parameter will alse be accepted

# check to see if parameter is --help and display if true
readonly priority=(research chapter)
if test $1 = "--help"
then
      echo "This is the TODO app" 
      echo "Usage: todo.sh TASKNAMES"
      echo
      echo "- Priority tasks are those with the keywords:"
      echo " research and chapter"
      echo "- Priority keywords are given twice as much time as normal tasks"
else
      #create Tasks directory and files based on task names provided as parameters
      #create Tasks directory if it does not exists
      declare -i ptasks_counter=0
      [ ! -d ~/Tasks ] && mkdir ~/Tasks
      for taskname in $@
      do
	 : > ~/Tasks/$taskname.txt
         #check for priority keywords and put in variable
         [ $taskname = ${priority[0]} || $taskname = ${priority[1]} ] && {
	    ((ptasks_counter++))
            ptasks="$ptasks $taskname"
         }
      done
      #workout time blocks
      readonly total_time_blocks=$(($#+$ptasks_counter))
      readonly time_blocks=$(((8*60)/$total_time_blocks))
      #display task list with time blocks and allocate double blocks for priority tasks
      declare -i task_count=0
      clear
      echo -e "No. \t Time \t Taskname"
      echo -e "--- \t ---- \t --------"
      while [ $# -gt 0 ]
      do
	 [ echo "$ptasks" | grep -q "$1" ] && declare -i time_allocation=$(($time_block*2))
	 time_allocation=$time_block
	 ((task_count++))
	 echo -e $task_count "\t" $time_allocation "\t" $1
	 shift
      done
fi


