#!/bin/sh
# Shell script to display and then email images.
# Aidan Barrington UNSW COMP2041 2013 S2


#set -x



for file in "$@"
do
        echo Displaying $@ images...
        display "$file"
done

for file in "$@"
do
    read -p "Address to e-mail this image to?" email_address

    echo "$email_address" | egrep '@' && read -p "Message to accompany image?" message && mutt -s "$message" -a $file -- $email_address
done

