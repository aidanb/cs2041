#!/usr/bin/perl -w

# Perl script to print the frequency of a specific word for each poet.
# Aidan Barrington UNSW COMP2041 2013 S2

# output: # occurances/ # total words : frequency author
# Hint: use a hash table of hash tables indexed by poet and word to store the word counts.
# ie %poets is (poet, wc_array),
#    %words is (word, count).


use warnings;
use strict;

foreach my $file (glob "poets/*.txt") {

    open F, "$file" or die "Error opening $file";

    my $words = 0;
    my $count = 0;

    while(my $line = <F>) {
        $words += split(/[^A-Za-z]+/, $line);
        $count += $line =~  m/\b$ARGV[0]\b/ig;
    }

    my $poet = $file;
    $poet =~ s/^poets\///;
    $poet =~ s/_/ /g;
    $poet =~ s/.txt//;

    printf "%4d/%6d = %.9f %s\n", $count,$words, $count/$words, $poet;
}