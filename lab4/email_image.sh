#!/bin/sh
# Shell script to display and then email images.
# Aidan Barrington UNSW COMP2041 2013 S2


#set -x

num_images=$#

for file in "$@"
do
        echo Displaying $@ images...
        display "$file"
done

echo Address to e-mail this image to? 
