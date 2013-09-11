#!/usr/bin/perl -w

# Perl script to print the frequency of a specific word for each poet.
# Aidan Barrington UNSW COMP2041 2013 S2


# output: # occurances/ # total words : frequency author
# Hint: use a hash table of hash tables indexed by poet and word to store the word counts.
# ie %poets is (poet, wc_array),
#    %words is (word, count).

use warnings;
use strict;

die "Usage: $!: word" if (!@ARGV or $ARGV[0] =~ /[^a-z]/i);

my $poet_name;
my @words;
my %poets;

foreach my $file (glob "poets/*.txt") {
    
    open F, $file or die "Error opening $file";

    $poet_name = $file;
    $poet_name =~ s/poets\///;
    $poet_name =~ s/_/ /g;
    $poet_name =~ s/.txt//;


    #read all the words into an array split on non-[a-z]
    while (my $line = <F>) {
        chomp($line);
        $line =~ tr/.,:;!?"(){}//d;            #remove some common punctuation symbols 
        push (@words, split(/\s+/, $line));        # split includes empty strings, so wc is off slightly.
    }  
   
    foreach my $word (@words) {
        $poets{$poet_name}{$word}++;
    }

    printf("%4d/%6d = %.9f %s\n", $poets{$poet_name}{$ARGV[0]}, $#words, $poets{$poet_name}{$ARGV[0]}/$#words, $poet_name);

    @words = ();
    close F;
}