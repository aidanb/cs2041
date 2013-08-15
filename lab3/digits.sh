#!/bin/sh
# Shell script to replace
# 1 2 3 4 with <
# 6 7 8 9 with >

tr 012346789 '<<<<<>>>>'
