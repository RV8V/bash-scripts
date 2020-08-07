#!/bin/bash
: 'subshell.sh'

readonly outer=Outer
(
  readonly inner=Inner
  echo "child process, \"inner\"=$inner"
)

[ -z $inner ] && echo "variable inner is not defined in parent process" && exit $?
echo "parent process, \"inner\"=$inner" && exit $?
