#!/bin/bash
#
# a todo app that creates a list of tasks based on script parameters and
# allocates time to each task based on 8 working hours
# priority tasks get double the time than normal tasks
# the help parameter will alse be accepted
#

# check to see if parameter is --help and display if true
if test $1 = "--help"
then
      echo "This is the TODO app" 
      echo "Usage: todo.sh TASKNAMES"
      echo
      echo "- Priority tasks are those with the keywords:"
      echo " research and chapter"
      echo "- Priority keywords are given twice as much time as normal tasks"
fi


