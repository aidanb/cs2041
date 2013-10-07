#!/usr/bin/perl -w

# given course codes as arguments prints details of their lectures.
# Aidan Barrington UNSW COMP2041 2013 S2

use strict;
use warnings;

my $base_url = "http://www.timetable.unsw.edu.au/2013/";
my $lectures_per_hour = 1 if ($ARGV[0] =~ /-t/);
my $hourly_details = 1 if ($ARGV[0] =~ /-d/);

die "Usage: $0 Four-character UNSW course code"
	if ((!@ARGV) or (!$lectures_per_hour && !$hourly_details 
		&& $ARGV[0] !~ /^[a-z]{4}[0-9]{4}$/i));

print "Checking for lectures...\n";

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
			push(@lectures, "\n$course_code: ");
			push(@lectures, "$sem ");
		}

		if ($_ =~ /<a href=\"#$sem.*Lecture/) {		#  <a href="#S1-2417">Lecture</a>
			$lecture_next_line = 6;
		}

		if ($lecture_next_line eq 0 &&
			$_ =~ /\"data\">([MTWF][ouehr][nedui] [0-9].*)</) {
			push(@lectures, "$1 ");
		}


        chomp;

        if ($_ =~ "Semester 1") {
            push(@lectures, "S1");
        }
        if ($_ =~ "Semester 2") {
            push(@lectures, "S2");
        }

		next if $_ !~ /<td class=\"data\">[MTWF][ouehr][nedui] [0-9]/;           # <td class="data">
        s/<td class=\"data\">//;
        s/<\/td>//;
        s/\t//;
        s/^\s*//;
        
	}

	if ($lectures_per_hour) {
		&printLecturesPerHour(\@lectures, $course_code);
	} elsif ($hourly_details) {
		&printHourlyDetails(\@lectures, $course_code);
	} else {
		print @lectures;
	}
}
print "\n";

sub printLecturesPerHour {

	my ($array_ref, $course_code) = @_;
	my @array = @$array_ref;

	foreach my $x (@array) {
		print "$x\n";
	}

	if (grep(/^S1 $/, @array)) {
		print "S1\tMon\tTue\tWed\tThur\tFri";
	}

	if (grep(/^S2 $/, @array)) {
		print "S2\tMon\tTue\tWed\tThur\tFri";
	}

}

sub printHourlyDetails {
	
	my ($array_ref, $course_code) = @_;
	my @array = @$array_ref;
	my $semester;

	foreach my $x (@array) {

		if ($x =~ /(S[12])/) {
			$semester = $1;
		}

		my @z;
		if ($x =~ /.*,.*/) {
			@z = split('\),', $x);
		} else {
			@z = split(/doesnotexist/, $x);
		}

		foreach my $lec (@z) {
			my @y = split(':', $lec);
			print "$semester $course_code $y[0]\n" if ($y[0] =~ /\w{3} \d{2}/);
		}
	}
}