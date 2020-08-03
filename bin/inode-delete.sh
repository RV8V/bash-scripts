#!/bin/bash

readonly ARGCOUNT=1
readonly E_WRONGARGS=70
readonly E_FILE_NOT_EXISTS=71
readonly E_CHANGED_MIND=72

[ $# -ne $ARGCOUNT ] && echo "Usage: `basename $0` filename" && exit $E_WRONGARGS
[ ! -e $1 ] && echo "File \"$1\" does not exit" && exit $E_FILE_NOT_EXIST
declare -i inum=`ls -i | grep $1 | awk '{print $1}'` && echo y/n; read

[ $REPLY = -y ] && find . -inum $inum -exec rm {} \; : 'file was deleted' exit $?

{
  readonly directory=/usr/sbin
  readonly permisions=+4000
  for file in $(find $directory -perm $permisions); do ls -lt --clasify --author $file; done
}
