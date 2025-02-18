#!/bin/sh
# Shell script to covert all jpeg files in a directory to png format.
# Aidan Barrington UNSW COMP2041 2013 S2

#set -x

for file in *.jpg
do
        filename=`echo "$file" | cut -d. -f1`
        if find "$filename".png > /dev/null 2>&1
        then
            echo File "$filename".png already exists, exiting.
            exit 1
        fi

        echo Converting $file to $filename.png...
        convert "$file" "$filename.png"

done

for file in *.jpg
do
        filename=`echo "$file" | cut -d. -f1`
        if find "$filename".jpg > /dev/null 2>&1 && find "$filename".png > /dev/null 2>&1
        then
            echo Removing "$file"...
            rm "$file"
        fi
done
