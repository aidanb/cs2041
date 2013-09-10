#!/usr/bin/perl -w

# Perl script to check prereqs for any UNSW course.
# Aidan Barrington UNSW COMP2041 2013 S2

use warnings;
use strict;

my $course;
my $lines;
my @prereqs;

#handle recursive case first, just grow the array with successive
#	courses then work from the end.
if (@ARGV == 1) {
	$course = $ARGV[$#ARGV];
} elsif (@ARGV == 2) {
	die if ($ARGV[0] !~ /r/);
	$course = $ARGV[$#ARGV];
} else {
	die "$0: Usage: ABCD1234; must be a valid UNSW course code";
}

my $undergrad = "http://www.handbook.unsw.edu.au/undergraduate/courses/2013/$course.html";
my $postgrad = "http://www.handbook.unsw.edu.au/postgraduate/courses/2013/$course.html";

if ($course =~ /^\w{4}(\d){4}$/i) {
	
	if ($1 < 9) {		# $1 here refers to the first digit captured in the regex above
		open(WWW, "wget -q -O- $undergrad |") or die;
	} else {
		open(WWW, "wget -q -O- $postgrad |") or die;
	}

	while ($lines = <WWW>) {
		chomp ($lines);

		if ($lines =~ /^\s*<(script|style)/i) {
			while ($lines = <WWW>) {
				last if $lines =~ /^\s*<\/(script|style)/i;
			}
		}
		$lines =~ s/&\w+;/ /g;
		$lines =~ s/<[^>]*>/-/g;

		if ($lines =~ s/.*?Prerequisite\://i) {
			$lines =~ s/-.*//g;
         	while($lines =~ s/(\w4}\d{4})//i ) {
            	#print "$1\n";
            	push (@prereqs, $1);
            	system("$0 $1") if @ARGV == 2;
			}
		}
	}

}

@prereqs = sort @prereqs;			#Why doesn't this sort the array alphabetically?
foreach my $prereq(@prereqs) {
	print "$prereq\n";
}
