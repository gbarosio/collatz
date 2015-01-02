#!/usr/bin/perl

use strict;

my $input = @ARGV[0];
my $debug = @ARGV[1];

usage() if !$input;

main($input);

sub main($) {

	# check that $arg is an integer, otherwise complain
	my $arg = shift;

	if ( $arg =~ /^\d+$/ ) {
	 	my $calc = algo($arg);
		print "Took me [$calc] operations to resolve 3n+1 given $arg as an argument\n";
	} else {
		# it is not an integer, check your fingers
		print "$arg is not an integer\n";
		usage();
	}
}

sub algo($) {
	my $int = shift; 
	my $x = 0;
	while ($int > 1 ) {
		$x++;
		print "int = $int\n" if $debug;

		if ($int % 2 == 0) {
			$int =  $int / 2;
		} else {
			$int =  $int * 3 + 1;
		}
	}

	return $x;	
}

sub usage {
	print "$0 <integer> <debug>\n";
	exit;
}
