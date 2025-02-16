#!/bin/bash

#Diskusage

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

while IFS= read -r line
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6f}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITIONis more than $DISK_THRESHOLD current value: $USAGE Please check"
    fi
done <<< $DISK_USAGE



