#!/bin/bash

[ $# -eq 0 ] && directories=`pwd` || directories=$@

linkchk() {
  for elem in $1/*; do
  [ -h "$elem" -a ! -e "$elem" ] && echo \"$elem\"
  [ -d "$elem" ] && linkchk $elem
  done
}

for dir in $directories; do
  if [ -d $dir ];
     then linkchk $dir
     else
	 echo "$dir is not a directory"
	 echo "order usage: $0 dir1 dir2 ..."
  fi
done

exit $?
