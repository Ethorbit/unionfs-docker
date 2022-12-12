#!/bin/sh 
DIR="/merged/$MERGED_DIR_NAME"

umount "$DIR" 2>&1
[ ! -d "$DIR" ] && mkdir "$DIR"

chown "$PUID":"$PGID" "/merged"

/usr/bin/unionfs -o auto_unmount,allow_other,uid=$PUID,gid=$PGID,umask=$UMASK,max_files=32000 /top=RW:/bottom=RO "$DIR"

# wait indefinitely as long as mount is valid (so container doesn't stop)
while [[ "$(grep "$DIR" /proc/mounts)" ]]; do 
    sleep 3
done 
