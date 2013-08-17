#!/bin/bash
# Shell script to print a list of UNSW courses with a given prefix.
# Works by extracting data from the online UNSW handbook.


if test "$#" -eq 1
    then
        code=`echo $1 | tr [a-z] [A-Z]`
        if [[ $code =~ [A-Z]{4} ]]
        then
            echo "Searching for $code courses...."
            echo `wget -q -O- "http://www.handbook.unsw.edu.au/vbook2012/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$code" | egrep "$code[0-9]{4}.html" | cut -d'/' -f7 | cut -c1-8,15- | tr \> " " | tr '< ' '\n' | sed "s/</\\n/g" ` #newline replace not working!
        else
            echo "Usage: $0 <4-char course code>" 1>&2
        fi
    else
        echo "Usage: $0 <4-char course code>" 1>&2
fi

