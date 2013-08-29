#!/usr/bin/perl -w
# Perl script to convert [01234] to < and [6789] to >.
# Aidan Barrington UNSW COMP2041 2013 S2
use warnings;
use strict;

while (<>) {
s/[01234]/</gi;
s/[6789]/>/gi;
print;
}
