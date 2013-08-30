#!/usr/bin/perl -w

# Perl script to mimic tail.
# Aidan Barrington UNSW COMP2041 2013 S2

use warnings;
use strict;

my $index = 0;
my $i = 0;
my $n = 10;


if ($ARGV[0] =~ "-[0-9]") {
    $n = substr($ARGV[0],1);
    $index = 1;
} else {
    $index = 0;
}

while ($index <= $#ARGV) {
    if (open F, $ARGV[$index]) {
        my @lines = <F>;

        print "==> $ARGV[$index] <==\n" if ($#ARGV>1 && $index>1);

        $i=$#lines-$n+1;
        while ($i<=$#lines)      {
            print "$lines[$i]";
            $i++;
        }
        close F;
    } else {
        print "$0: can't open $ARGV[$index]\n";
    }
    $index++;
}
