#!/usr/bin/perl -w

# given course codes as arguments prints details of their lectures.
# Aidan Barrington UNSW COMP2041 2013 S2

use strict;
use warnings;

my $base_url = "http://www.timetable.unsw.edu.au/2013/";

die "Usage: $0 Four-character UNSW course code"
	if ((!@ARGV) or ($ARGV[0] !~ /^[a-z]{4}[0-9]{4}$/i));

	print "Checking for lectures...";

foreach (@ARGV) {
	
	my @lectures;

	my $course_code = $_;
	$course_code =~ tr/[a-z]/[A-Z]/;

	my $url = $base_url;
	$url .= $course_code;
	$url .= ".html";

	open F, "wget -q -O- $url|" or die "could not open website";


	my $lecture_next_line = 0;
	my $sem = "";


	while (<F>) {
		
		$lecture_next_line--;

		if ($_ =~ /a href=\"#(S.)-.*\">/ && $1 ne $sem) {
			$sem = $1;
			push(@lectures, "\n$course_code: $sem ");
		}

		if ($_ =~ /<a href=\"#$sem.*Lecture/) {		#  <a href="#S1-2417">Lecture</a>
			$lecture_next_line = 6;
		}

		if ($lecture_next_line eq 0 &&
			$_ =~ /\"data\">([MTWF][ouehr][nedui] [0-9].*)</) {
			push(@lectures, "$1 ");
		}

	}
	print @lectures;
	print "\n";

}