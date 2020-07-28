#!/bin/bash

/usr/bin/find /tmp -type f -name '*' -mtime +7 -print0 | xargs -p -0 -I % sh -c 'echo %; /bin/rm -f %'
/usr/bin/find /proc -user username -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
/usr/bin/find . -type d -print | /usr/bin/xargs -P 4 -I {} /bin/tar czf {}.tar.gz {}
/usr/bin/find . -type f -and -iname '*.deb' | /usr/bin/xargs -n1 -I x dpkg -i x
/usr/bin/dpkg -l linux-* | awk '/^ii/{ print $2 }' | grep -e -v $(uname -r | cut -f1,2 -d"-") | grep -e [0-9]

