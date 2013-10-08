#!/bin/bash
# Shell cgi script displays the IP address and hostname of the web client accessing it.
# Aidan Barrington CS2041 S2 2013 UNSW

#set -x

echo '


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
<tr><td>Browser IP Address<td>129.94.242.38
<tr><td>Browser Hostname<td>piano14.orchestra.cse.unsw.EDU.AU
<tr><td>Browser<td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17
</table>
</body>
</html>
'
