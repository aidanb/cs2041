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

my $check_word = $ARGV[0];
my $poet;
my @words;
my %poets;
my %poet;

foreach my $file (glob "poets/*.txt") {
    
    open F, $file or die "Error opening $file";

    my $wc = 0;
    $poet = $file;
    $poet =~ s/poets\///;
    $poet =~ s/_/ /g;
    $poet =~ s/.txt//;
    #print "$poet\n";    

    #read all the words into an array split on whitespace
    while (my $lines = <F>) {
        chomp($lines);
        
        push (@words, split(/\s+/, $lines));        # split includes empty strings, so wc is off slightly.
    }  
   
    foreach my $word (@words) {
        $poets{$poet}{$word}++;
    }

#    %poets = ("$poet" => "$word_count");

    close F;
}

#    foreach my $x (keys %poets) {
#        foreach my $y (keys %poet) {
#            print "arval: $x -> $y -> $poets{$x}{$y}\n";        
#        }                
#    }

foreach my $x (keys %poets) {
    print "$poets{$x}{$check_word}/ num = num2 $x \n";
}
