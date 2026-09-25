#!/bin/bash

threshold=80

df -P | awk 'NR>1 {print $5, $6}' | while read -r usage mountpoint
do
    usage=${usage%\%}

    if [ "$usage" -ge "$threshold" ]; then
        echo "Warning: $mountpoint usage is ${usage}%"
    fi
done
