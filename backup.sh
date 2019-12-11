#!/bin/bash

date=$(date '+%Y-%m-%d')
linenumber=1
zfs list -H -t snapshot -o name | grep -i $date | while read line; do
    echo "$line"
    zfs send ${line} | gzip > /mnt/snapshots/${date}-${linenumber}.gz
    ((linenumber++))
done
#sudo zfs send ${result} | gzip > /mnt/snapshots/${date}.gz
echo "Done!"
