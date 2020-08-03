#!/bin/bash
: ' 
 a todo app that creates a list of tasks based on script parameters and
 allocates time to each task based on 8 working hours
 priority tasks get double the time than normal tasks
 the help parameter will alse be accepted
'
readonly priority=(research chapter)
if test $1 = "--help"
then
      echo "This is the TODO app" &&  echo "Usage: todo.sh TASKNAMES" && echo &&  echo "- Priority tasks are those with the keywords:"
      echo " research and chapter" && echo "- Priority keywords are given twice as much time as normal tasks"
else
      declare -i ptasks_counter=0
      [ ! -d ~/Tasks ] && mkdir ~/Tasks
      for taskname in $@
      do
	 : > ~/Tasks/$taskname.txt
         [ $taskname = ${priority[0]} -o $taskname = ${priority[1]} ] && {
	    ((ptasks_counter++))
            declare -i ptasks="$ptasks $taskname"
         }
      done

      readonly total_time_blocks=$(($#+$ptasks_counter))
      readonly time_blocks=$((`echo '8*60' | bc`/$total_time_blocks))
      declare -i task_count=0 && clear
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
