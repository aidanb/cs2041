#!/bin/bash
# Shell script to print a string n times.
# Aidan Barrington


if [ "$#" = 2 ]
then
    n=$1
    string=$2
else
    echo "Usage: $0 <n> <string>" 1>&2
    exit 1
fi

if echo "$n" | egrep -v '^[0-9]' > /dev/null
    then
        echo "$0: argument '$n' is not a non-negative integer" 1>&2
        exit 1
fi

while test $n -gt 0
do
    echo $string
    let "n = $[$n-1]"
done

