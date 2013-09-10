#!/usr/bin/python 

# Python script to replace 0-4 with < and 6-9 with >.
# Aidan Barrington UNSW COMP2041 2013 S2


import sys
import re

text = ""

while 1:

	text = raw_input()

	text = re.sub('[0-4]', '<', text)
	text = re.sub('[6-9]', '>', text)
	print text



