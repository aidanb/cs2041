#!/usr/bin/perl -w

# Perl script to print a string n times.
# Aidan Barrington UNSW COMP2041 2013 S2

use warnings;
use strict;

if (!@ARGV or $ARGV[0] !~ /(\d)/ or $ARGV[1] !~ /(\w)/ or $#ARGV != 1) { 
die "Usage: $0 <n> <string>";
}
    
my $n = $ARGV[0];
my $string = $ARGV[1];

while ($n > 0) {
    print "$ARGV[1]\n";
    $n--;
}
