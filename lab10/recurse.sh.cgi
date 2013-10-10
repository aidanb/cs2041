#!/bin/bash
# Shell cgi script displays the IP address and hostname of the web client accessing it.
# Aidan Barrington CS2041 S2 2013 UNSW

#set -x


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
echo 
cat<<eof
<pre>

<a href="http://cgi.cse.unsw.edu.au$x">Run me again<a/>


</body>
</html>

eof
