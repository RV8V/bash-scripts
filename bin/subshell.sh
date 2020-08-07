#!/bin/bash
: 'subshell.sh'

readonly outer=Outer
(
  readonly inner=Inner
  echo "child process, \"inner\"=$inner"
  (cat $1 $2 $3 | sort | uniq > list$1$2$3) &
  (cat $4 $5 $6 | sort | uniq > list$4$5$6) & && wait
  diff list$1$2$3 list$4$5$6 
)

[ -z $inner ] && echo "variable inner is not defined in parent process" && exit $?
echo "parent process, \"inner\"=$inner" && exit $?
