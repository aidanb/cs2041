#!/bin/bash

# Shell script to print the names of files in the current directory 
# grouped into small, medium, and large (<10, 10-100, >100 lines).

echo -ne "Small files: "

for file in *
do
    lines=`wc $file | cut -f2 -d' '` 

    if test $lines -lt 10 
    then
        echo -ne "$file "
    fi
done
echo #add a new line after each list

echo -ne "Medium-sized files: "

for file in *
do
    lines=`wc $file | cut -f2 -d' '` 

    if test $lines -gt 10 
    then
        if test $lines -lt 100
            then
                echo -ne "$file "
        fi
    fi
done
echo #add a new line after each list

echo -ne "Large files: "

for file in *
do
    lines=`wc $file | cut -f2 -d' '` 

    if test $lines -gt 100
    then
        echo -ne "$file "
    fi
done
echo #add a new line after each list
