#!/usr/bin/env perl
use strict;
use warnings;

#usage: cat mayday.diff | utils/hunkfinder.pl data/init/interface.txt 24

my $filename = $ARGV[0] or die "need filename of diffed file";
my $hunkno = $ARGV[1] or die "need hunknumber as second arg";

my $infile = 0;
my $hunk = 0;
my $switched = 0;

while(<STDIN>) {
	$switched = 0;
	$infile = 1, $switched = 1 if(!$infile && /^diff (.*?)\Q$filename\E/);
	if($infile) {
		if(/\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/) {
			$hunk++;
		}
		if($hunk == $hunkno) {
			print;
		}
		$infile = 0 if(!$switched && /^diff /);
	}
}
