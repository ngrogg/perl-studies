#!/usr/bin/perl
use warnings;
use strict;

# Arguments
# By Nicholas Grogg
# A demonstration of passing command line arguments to Perl and to functions

# Function to run program
sub runProgram {
	print "Arguments\n";
	print "----------------------------------------------------\n";
	print "Pass three values to script\n";
	print "ex. ./arguments.pl 1 2 3\n\n";

	## Read passed values
	my ($arg1,$arg2,$arg3) = @_;

	## Output passed values
	print "Value 1: $arg1\n";
	print "Value 2: $arg2\n";
	print "Value 3: $arg3\n";
}

# Parse passed values
my ($arg1,$arg2,$arg3) = @ARGV;


# Run the function
runProgram($arg1,$arg2,$arg3);
