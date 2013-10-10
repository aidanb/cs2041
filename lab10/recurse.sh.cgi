#!/bin/bash
# Shell cgi script displays the IP address and hostname of the web client accessing it.
# Aidan Barrington CS2041 S2 2013 UNSW

#set -x



if [ -z `echo $QUERY_STRING` ]
then 
    y=0
else 
    y=`expr $QUERY_STRING + 1`
fi



cat <<eof
Content-type: text/html

<!DOCTYPE html>
<html>
<head>
<title>Recurse</title>
</head
<body>
<b>Level $y</b>: 

<pre>
eof

x=`env | grep REDIRECT_SCRIPT_URL | cut -d'=' -f2`

cat<<eof
<pre>

<a href="http://cgi.cse.unsw.edu.au$x?$y">Run me again<a/>


</body>
</html>

eof
