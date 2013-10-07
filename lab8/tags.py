#!/usr/bin/python -u

import sys, re, subprocess

freq = 0;

for url in sys.argv[1:len(sys.argv)]:

	if(re.match('-f', url)):
		freq = 1;	
	else:
		html = {}
		p = subprocess.Popen(["wget","-q","-O-",url], stdout=subprocess.PIPE)
		file = ''.join(p.stdout.readlines())
      
        	tags = re.findall(r'\<\s*\w+\s',file)
	        for tag in tags: 
        	      	tag = re.sub(r'[\<\s]', '', tag)
			if(not html.has_key(tag)):
				html[tag] = 0
			html[tag] += 1

if freq:
	
	for key in sorted(html.keys(), key=html.get):
		print key + " " + str(html[key]*2)

else:
	for key in sorted(html.keys()):
		print key + " " + str(html[key]*2)
