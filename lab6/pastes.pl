#!/usr/bin/perl -w

# Perl script to mimic /usr/bin/paste -s.
# Aidan Barrington UNSW COMP2041 2013 S2

use warnings;
use strict;

die '$! Usage: file1 file2 filen' if (!@ARGV);

foreach my $file (@ARGV) {
	open (F, $file) or die 'Could not open $file';

	$_ = <F>;
	chomp;
	print;

	while (<F>) {
		print "\t";
		chomp;
		print;
	}
	print "\n";
}