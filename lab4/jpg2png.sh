#!/bin/sh
# Shell script to covert all jpeg files in a directory to png format.

set -x

for f in "`ls`"
do
    if `echo "$f" | grep .jpeg`
    then        
        echo "$f"
    fi
done
