#!/bin/bash

readonly LOG_DIR=/var/log/
declare -i ROOT_UID=0
declare -i LINES=50
declare -i E_NOTROOT=67
declare -i EXP_ARGS=1
declare -i SUCCESS=0

if /usr/bin/[  "$UID" -ne "$ROOT_UID"
then
  echo "For work you have to use root rights" >&2 errors 2> /dev/null
  echo $E_NOTROOT >> errors  
  exit $?
fi  

if /usr/bin/[ "$#" -ne $EXP_ARGS
then
  echo "Usage: `basename $0` whatever" >> errors
  local WRONG_ARGS=$@
  echo "Wrong args: $WRONG_ARGS used in script `basename $0`" >> errors
  exit $?
fi 

if /usr/bin/[ -n "$1"
then lines=$1
else lines=$LINES : "values by defult if $1 is not defined"
fi

cd $LOG_DIR
tail -$lines messages > mesg.tmp
mv mesg.tmp messages

: > wtmp
#!/bin/rm
echo "Log files are cleaned" 1> res
echo "see log file for errors and result: 'errors', 'res' respectively"
exit $SUCCESS
