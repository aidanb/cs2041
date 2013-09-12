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

    while (<F>){
        tr/[A-Z]/[a-z]/;
        @words = split /[^a-z]/;
        foreach my $word (@words) {
            $poets{$poet_name}{$word}++;
            $poets{$poet_name}{"total_wc"}++ if length($word) > 0;
        }
    }
    
    my $total_wc = $poets{$poet_name}{"total_wc"};
    
    {
        no warnings 'uninitialized';
        printf("log((%d+1)/%6d) = %8.4f %s\n", $poets{$poet_name}{$ARGV[0]}, 
                                                $total_wc, 
                                                log((1+$poets{$poet_name}{$ARGV[0]})/$total_wc),
                                                $poet_name);
    }

    @words = ();
    close F;
}