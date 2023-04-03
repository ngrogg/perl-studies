#!/usr/bin/perl
use strict;
use warnings;

# userMod script
# Creates, modifies or deletes users
# Designed to be used with Password Manager Pro
# By Nicholas Grogg

# Function to run program
sub runProgram {
	print "User Mod\n";
	print "----------------------------------------------------\n";

	## Read passed values
	my ($action, $username,$addendum) = @_;

	## Check first passed value and act on it
	## Output help, lc for case insensitivity
	if ( lc $action eq lc "help") {
		print "Help\n";
		print "----------------------------------------------------\n";
	}

	## Add user
	elsif (lc $action eq lc "add") {
		print "Add User\n";
		print "----------------------------------------------------\n";

		### Check if user exists
		### Confirm user type
		### Create user

	}

	## Modify user
	elsif (lc $action eq lc "modify") {
		print "Modify user\n";
		print "----------------------------------------------------\n";
		### Change password
		### Add to group

	}

	## Delete user
	elsif (lc $action eq lc "delete") {
		print "Delete User \n";
		print "----------------------------------------------------\n";
		### Confirm username
		### Delete user
	}

	## Lock user
	elsif (lc $action eq lc "lock") {
		print "Lock User \n";
		print "----------------------------------------------------\n";
		### Confirm username
		### Delete user
	}

	## Else error
	else {
		print "Invalid Input detected\n";
		print "----------------------------------------------------\n";
		print "Re-run with valid input\n";
		print "For valid input pass 'help' as first argument\n";
	}
}

# Parse passed variables
my ($action, $username, $addendum) = @ARGV;

# Run the program, pass CLI variables
runProgram($action,$username,$addendum);
