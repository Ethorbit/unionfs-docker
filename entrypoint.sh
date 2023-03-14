#!/bin/sh 
/usr/bin/unionfs $@

for mount_point in $*; do test "$mount_point"; done
res=0 && while [[ "$res" -eq 0 ]]; do 
    findmnt "$mount_point" > /dev/null
    res=$?
    sleep 3
done 
