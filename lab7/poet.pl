#!/usr/bin/perl -w

# given a file containing a poem prints the most likely poet.
# Aidan Barrington UNSW COMP2041 2013 S2

# This implementation is somewhat naive.
#   Possible optimisation: store words from unknown poem in a hash so
#       we don't check duplicate words, ie score is occurances * likelihood.

use strict;
use warnings;

# For each poet you calculate the log-probablity that they wrote it
#   by summing the log-probablity of that poet using each word.

die "Please specify text files containing poetry you would like analysed" 
    if (!@ARGV or $ARGV[0] !~ /\w*\.?[txt]?/);

my %log_freq;

#Repeat once for each poem...
#foreach my $poem (glob $ARGV[0]) {
    foreach my $poem (glob "poem?.txt") {

    #Get all the words from the poem...
    my @words;
    open P, "$poem" or die "Error opening $poem";
    while (<P>) {
        chomp();
        tr /[A-Z]/[a-z]/;
        push(@words, split(/[^a-z]+/));
    }

    #For each poet:
    foreach my $word (@words) {
        
        
        my @log_output =  `./log_frequency.pl $word`;
        
        foreach (@log_output) {
            chomp();
            my @log_and_name = split ('=');
            #print $log_and_name[1];
            my @split_log_and_name = split(' ', $log_and_name[1], 2);
            #print "$split_log_and_name[0]\t\t\t\t";
            #print "$split_log_and_name[1]\n";
            my $freq = $split_log_and_name[0];
            my $poet = $split_log_and_name[1];
            $log_freq{$poet} += $freq;
       }
        
    }
    @words = ();

    my @sortedkeys = sort { $log_freq{$b} <=> $log_freq{$a} } keys %log_freq;
    my $result = $sortedkeys[0];

    printf "%s most resembles the work of %s (log-probablity=%.1f)\n",$poem,$result,$log_freq{$result};

}
