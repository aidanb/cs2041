#!/usr/bin/perl -w

# prints the course codes with a given prefix 
#	of all UNSW courses with lectures on the Kensington Campus this session
# Aidan Barrington UNSW COMP2041 2013 S2

use strict;
use warnings;

my $year = 2013;
my $url = "http://www.timetable.unsw.edu.au/current/";

die "Usage: $0 Four-character UNSW course code"
	if ((!@ARGV) or ($#ARGV > 0) or ($ARGV[0] !~ /^[a-z]{4}$/i));

my $course_code = $ARGV[0];
$course_code =~ tr/[a-z]/[A-Z]/;
$url .= $course_code;
$url .= "KENS.html";

print "Checking for UNSW course codes with prefix $course_code...\n";

open F, "wget -q -O- $url|" or die "could not open website";

while (<F>) {
	next if $_ !~ /href=\"$course_code/;
	s/<.*.html\">//;
	s/<\/.*//;
	s/\s//g;
	print "$_\n" if $_ =~ /[A-Z]{4}/;
}