#!/usr/bin/perl

# Perl script to update computer 
# By Nicholas Grogg

# Function to run program
sub runProgram {
	## Check for package managers
	### Check for apt
	if (-e "/usr/bin/apt") {
		print "Apt\n";
		system("sudo apt update && sudo apt upgrade");
	}
	
	### Check for yum
	elsif (-e "/usr/bin/yum") {
		print "Yum\n";
		system("sudo yum update");
	}

	### Check for pacman
	elsif (-e "/usr/bin/pacman") {
		print "pacman\n";
		system("sudo pacman -Syu");
	}

	### Check for zypper
	elsif (-e "/usr/bin/zypper") {
		print "zypper\n";
		system("sudo zypper update");
	}

	### Else something else 
	else {
		print "Something else is installed, update manually";
	}
}

# Run the program function
runProgram();
