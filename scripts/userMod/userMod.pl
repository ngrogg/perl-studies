#!/usr/bin/perl
use strict;
use warnings;

# userMod script
# Creates, locks or deletes users
# Designed to be used with Password Manager Pro
# By Nicholas Grogg

# Function to run program
sub runProgram {
	print "User Mod\n";
	print "----------------------------------------------------\n";

	## Read passed values
	my ($action, $username, $userType) = @_;

	## Check first passed value and act on it
	## Output help, lc for case insensitivity
	if ( lc $action eq lc "help") {
		print "Help\n";
		print "----------------------------------------------------\n";
		print "Create, lock or delete users\n";
		print "Acts based on first argument passed\n";
		print "Ex. ./userMod.pl ACTION\n\n";
		print "help, output this help message and exit\n\n";
		print "add, create a user\n";
		print "Takes an action, username and user type as arguments\n";
		print "Ex. ./userMod.pl add jdoe admin\n\n";
		print "For non-admin users pass 'regular' as argument\n";
		print "Ex. ./userMod.pl add jdoe regular\n\n";
		print "delete, deletes a user\n";
		print "Takes an action and username as arguments\n";
		print "Ex. ./userMod.pl delete jdoe\n\n";
		print "lock, locks a user\n";
		print "Takes an action and username as arguments\n";
		print "Ex. ./userMod.pl lock jdoe\n\n";
		exit 0;
	}

	## Add user
	elsif (lc $action eq lc "add") {
		print "Add User\n";
		print "----------------------------------------------------\n";

		### Check if user exists
		print "Checking if $username already exists\n";
		print "----------------------------------------------------\n";
		my $userExists = `grep $username /etc/passwd`;

		### If output above null, proceed
		if ($userExists eq ""){
			print "User $username doesn't exist, proceeding!\n";
			print "----------------------------------------------------\n";
			#TODO simply this section to reduce redundant code
			#### Confirm user type
			if (lc $userType eq lc "admin"){
				##### Confirm user creation
				print "Confirm creation of admin user $username: Y/N ";
				my $input = <>;
				chomp($input);

				##### Create user
				if (lc $input eq lc "y") {
					print "Creating admin user $username\n";
					print "----------------------------------------------------\n";
					###### Create user and add to wheel group
					system("sudo useradd -m $username");
					system("sudo usermod -a -G wheel $username");
					system("sudo service pmpagent-bash-service restart");
				}
				else {
					print "Not creating admin user $username\n";
					exit 0;
				}
			}
			elsif (lc $userType eq lc "regular"){
				##### Confirm user creation
				print "Confirm creation of regular user $username: Y/N ";
				my $input = <>;
				chomp($input);

				##### Create user
				if (lc $input eq lc "y") {
					print "Creating regular user $username\n";
					print "----------------------------------------------------\n";
					###### Create user
					system("sudo useradd -m $username");
					system("sudo service pmpagent-bash-service restart");
				}
				else {
					print "Not creating regular user $username\n";
					exit 0;
				}

			}
			else {
				print "ERROR - Invalid user type requested\n";
				print "----------------------------------------------------\n";
				print "Re-run with valid input\n";
				exit 1;
			}
		}

		### Else exit
		else {
			print "ERROR - user $username already exists\n";
			print "----------------------------------------------------\n";
			print "exiting\n";
			exit 1;
		}

	}

	## Delete user
	elsif (lc $action eq lc "delete") {
		print "Delete User \n";
		print "----------------------------------------------------\n";
		### Confirm username
		print "Confirm deletion of user $username: Y/N ";
		my $input = <>;
		chomp($input);

		### Delete user
		if (lc $input eq lc "y") {
			print "Deleting user $username\n";
			print "----------------------------------------------------\n";
			#### Delete user
			system("sudo deluser --remove-home $username");
		}
		else {
			print "Not deleting user $username\n";
			exit 0;
		}
	}

	## Lock user
	elsif (lc $action eq lc "lock") {
		print "Lock User \n";
		print "----------------------------------------------------\n";
		### Confirm username
		print "Confirm locking of user $username: Y/N ";
		my $input = <>;
		chomp($input);

		### Delete user
		if (lc $input eq lc "y") {
			print "Locking user $username\n";
			print "----------------------------------------------------\n";
			#### Lock user
			system("sudo passwd -l $username");
		}
		else {
			print "Not locking user $username\n";
			exit 0;
		}
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
my ($action, $username, $userType) = @ARGV;

# Run the program, pass CLI variables
runProgram($action,$username,$userType);
