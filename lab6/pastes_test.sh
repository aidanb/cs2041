#!/bin/sh 

# Shell script to test pastes.pl
# Aidan Barrington UNSW COMP2041 2013 S2


tmpFile="$0$(date +%H:%M:%S)"

files=""

for file in $@
do
   files="`echo $files $file`"
done

files="`echo $files '\n'`"
#echo $@files

echo "Running paste -s on files..."
paste -s $files > "$tmpFile"unix
echo "Running ./pastes.pl on files..."

./pastes.pl $files > "$tmpFile"perl
echo "Comparing Files"
diff "$tmpFile"unix "$tmpFile"perl

if [ $? ]; then		#returns exit value of last command 
   echo "Test succeeded - output of /usr/bin/paste -s matches ./pastes.pl"
else 
   echo "Test failed - output of /usr/bin/paste differs from ./pastes.pl"
fi

echo "Removing $tmpFile*..."
rm $tmpFile*