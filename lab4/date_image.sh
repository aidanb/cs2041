#!/bin/sh
# Shell script to label images with the time it was taken.
# Aidan Barrington UNSW COMP2041 2013 S2


#set -x

for file in "$@"
do
    date=`ls -l "$file" | cut -f6-8 -d' '`

    echo "Annotating $file with $date"
    convert -gravity south -pointsize 36 -annotate 0 "$date" "$file" tmp
    cp tmp "$file"

    echo "Modifying last-modified field from `ls -l "$file" | cut -f6-8 -d' '` to $date"
    touch "$file" -d "$date" 
done
