#!/usr/bin/perl
use warnings; 
use strict;

# forLoop
# By Nicholas Grogg
# A simple foor loop in perl

# Function to run program
sub runProgram {
	# Declare array to iterate through
	my @array = (1..9);

	# for loop
	for(@array){
		# Print array values
		print("$_","\n");
	}
}

# Run the function
runProgram();
