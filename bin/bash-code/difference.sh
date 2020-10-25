#!/bin/bash

# $@ is like array in javascript
# and param is the current element is this array
# all in all, it is normal behavior

for param in $@; do echo "param: $param"; done

echo $'\n'

# the same result
# it does not matter whether $@ is in
# double quotes "" or as it is

for elem in "$@"; do echo "elem: $elem"; done

echo $'\n'

# the same result as were before
# the are 3 examples are the same

for i in $*; do echo "i: $i"; done

echo $'\n'

###### the is the difference between $@ and $* ######
###### in this case we have only one string    ######

for index in "$*"; do echo "index: $index"; done
