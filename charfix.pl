#!/usr/bin/env perl
use strict;
use warnings;
my $old_s = "\xA2\x8A\x98\x97\xA3\x8D\xA1\x82\x95\x87\xA0\xA4\x84\x94\x88\x8C\x83\x93\x86\x85\x89\x8B\x96";
my $new_s = "\x6F\x65\x79\x75\x75\x69\x69\x65\x6F\x63\x61\x6E\x61\x6F\x65\x69\x61\x6F\x61\x61\x65\x69\x75";
my @old = split //, $old_s;
my @new = split //, $new_s;

sub contains {
	my ($what, @arr) = @_;
	my $i = 0;
	foreach my $c(@arr) {
		return $i if ($c eq $what);
		$i++;
	}
	return -1;	
}

while(<>) {
	my @line = split //;
	my $i = 0;
	foreach my $c(@line) {
		my $ret = contains($c, @old);
		$line[$i] = $new[$ret] if $ret >= 0;
		$i++;
	}
	print(join("", @line));
}
