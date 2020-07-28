#!/bin/bash

find /tmp -type f -name '*' -mtime +7 -print0 | xargs -p -0 -I % sh -c 'echo %; rm -f %'
find /proc -user username -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
