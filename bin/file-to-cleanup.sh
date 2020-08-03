#!/bin/bash
 
readonly LOG_DIR=/var/log/
declare -i ROOT_UID=0
declare -i LINES=50
declare -i E_NOTROOT=67
declare -i EXP_ARGS=1
declare -i SUCCESS=0

[ "$UID" -ne "$ROOT_UID" ] && {
  echo "For work you have to use root rights" >&2 errors 2> /dev/null
  echo $E_NOTROOT >> errors && exit $?
}

[ "$#" -ne $EXP_ARGS ] && {
  echo "Usage: `basename $0` whatever" >> errors
  readonly local WRONG_ARGS=$@
  echo "Wrong args: $WRONG_ARGS used in script `basename $0`" >> errors && exit $?
}

[ /usr/bin/[ -n $1 ] && lines=${1:-$LINES}

cd $LOG_DIR && tail -$lines messages > mesg.tmp && mv mesg.tmp messages

: > wtmp
#!/bin/rm
echo "Log files are cleaned" 1> res && echo "see log file for errors and result: 'errors', 'res' respectively"
exit $SUCCESS
