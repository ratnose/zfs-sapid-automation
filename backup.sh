#!/bin/bash

date=$(date '+%Y-%m-%d')
linenumber=1
zfs list -H -t snapshot -o name | grep -i $date | while read line; do
    zfs send ${line} | gzip > /mnt/snapshots/${date}-${linenumber}.gz
    ((linenumber++))
    echo "$line > /mnt/snapshops/$date-$linenumber.gz"
done
#sudo zfs send ${result} | gzip > /mnt/snapshots/${date}.gz
echo "Done!"
