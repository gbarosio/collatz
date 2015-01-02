#!/usr/bin/perl
# yet another 3n+1 example problem resolved using perl.
# should work on any default perl instalation.  
# gbarosio@gmail.com, 2015


# Copyright (c) 2015  Guido Barosio <gbarosio@gmail.com>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

use strict;

my $input = @ARGV[0];
my $debug = @ARGV[1];

usage() if !$input;

main($input);


# main function
sub main($) {

	# check that $arg is an integer, otherwise complain
	my $arg = shift;

	# if the argument given is not an integer ....
	if ( $arg =~ /^\d+$/ ) {  # check for an integer 
	 	my $calc = algo($arg); # it is an integer, go an calculate
		print "Took me [$calc] operations to resolve 3n+1 given $arg as an argument\n";
	} else {
		# it is not an integer, check your fingers
		print "$arg is not an integer\n";
		usage(); 
	}
}

# algo() resolves the 3n+1 problem after the initial input has been validated
sub algo($) {

	my $int = shift;  
	my $x = 0; # just another counter 

	while ($int > 1 ) {
		$x++;
		print "int = $int\n" if $debug;

		if ($int % 2 == 0) { # if the number is even we ...
			$int =  $int / 2;
		} else {
			$int =  $int * 3 + 1; # it's an odd number, 3n+1 !
		}
	}

	# once we are done, we return $x
	return $x;	
}

# need some help?
sub usage {
	print "Welcome to $0, yet another 3n+1 problem resolver written in perl\n";
	print "$0 <integer> <debug>\n";
	exit;
}
