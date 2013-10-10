#!/bin/bash
# Shell cgi script displays the IP address and hostname of the web client accessing it.
# Aidan Barrington CS2041 S2 2013 UNSW

#set -x


cat <<eof
Content-type: text/html

<!DOCTYPE html>

<html>
<head>
<title>IP, Host and Browser IP</title>
<style type="text/css">
table{border-collapse:collapse;margin:0 auto;line-height:20px;width:728px;table-layout:fixed;}
tr{height:30px;}
td{border: solid 1px;padding: 0px 10px;}
</style>
</head
<body>
<table id="info_table" >
<tr><td>Browser IP Address<td>

<pre>
eof

echo `hostname -i`

cat <<eof
</pre>

<tr><td>Browser Hostname<td>
<pre>
eof
echo `host $(hostname -i) | cut -d' ' -f2-3`
cat<<eof
<pre>

<tr><td>Browser<td>

<pre>
eof

echo `env | grep HTTP_USER_AGENT | cut -d'=' -f2`

cat <<eof
</pre>

</table>

</body>
</html>
eof


