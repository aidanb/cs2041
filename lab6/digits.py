#!/usr/bin/python 

# Python script to replace 0-4 with < and 6-9 with >.
# Aidan Barrington UNSW COMP2041 2013 S2


import sys
import pickle
import re
import os

print sys.argv

for argument_file in sys.argv[1:]:
	print argument_file
	inputFile = open(argument_file)
	text = inputFile.read()
	text = re.sub('[0-4]', '<', text)
	text = re.sub('[6-9]', '>', text)
	print text