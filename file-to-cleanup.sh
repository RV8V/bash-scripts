#!/bin/bash

LOG_DIR=/var/log/
ROOT_UID=0
LINES=50
E_NOTROOT=67
EXP_ARGS=1

if test "$UID" -ne "$ROOT_UID"
then
  echo "For work you have to use root rights"
  echo $E_NOTROOT
  exit 1
fi  

if test "$#" -ne $EXP_ARGS
then
  echo "Usage: `basename $0` whatever"
  local WRONG_ARGS=$@
  echo "Wrong args: $WRONG_ARGS used in script `basename $0`"
  exit 1
fi 

if test -n "$1"
then lines=$1
else lines=$LINES # values by defult if $1 is not defined
fi

cd $LOG_DIR
tail -$lines messages > mesg.tmp
mv mesg.tmp messages

: > wtmp
echo "Log files are cleaned"
exit 0
