#!/bin/sh
# Shell script to covert all jpeg files in a directory to png format.

#set -x

for file in *.jpg
do
        filename=`echo "$file" | cut -d. -f1`
        if find "$filename".png > /dev/null 2>&1
        then
            echo File "$filename".png already exists, exiting.
            exit 1
        fi

        convert "$file" "filename.png"

done

for file in *.jpg
do
        filename=`echo "$file" | cut -d. -f1`
        if find "$filename".png > /dev/null 2>&1
        then
            echo File "$filename".png already exists, exiting.
            exit 1
        fi

        convert "$file" "filename.png"

done
