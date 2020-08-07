#!/bin/bash
: 'subshell.sh'

readonly file=.bashrc
readonly outer=Outer

(
  readonly inner=Inner
  echo "child process, \"inner\"=$inner"
  (cat $1 $2 $3 | sort | uniq > list$1$2$3) &
  (cat $4 $5 $6 | sort | uniq > list$4$5$6) & && wait
  diff list$1$2$3 list$4$5$6 && exit $?

  while IFS=: read name password uid gid fullname ignore
  do echo $name, ($fullname) and $uid; done < /etc/passwd | head
  echo "no need to change variable \"IFS\" to previous state ->" && exit $? 
)

( : 'process substitution'
  while read des what mask iface; do echo $des->$what->$mask->$iface; done < <(route -n)
  route -n | while read des what mask iface; do $des $what $mask $iface; done
  : 'in this case (while) loop will be executed in child process and variables will not be seen after closure of chanel | '
)

(
  cat <(ls -l --recursive --classify /bin) && ls -lFR /bin | cat
  sort <(ls -m) <(ls -a /bin) <(ls -RF /usr/X11R6/bin) | less
  [ -f $1 -a -f $2 ] && diff <(cat $1) <(cat $2) | vim
  echo >(:) && echo <(:) : '/dev/fd/63 descriptor'  
)

for home in `awk -F: '{print $6} /etc/passwd'`
do
   [ -d "$home" ] || continue
   [ -r "$home" ] || continue
   (cd $home; [ -e $file ] && less $file)
done

[ -z $inner ] && echo "variable inner is not defined in parent process" && exit $?
echo "parent process, \"inner\"=$inner" && exit $?
