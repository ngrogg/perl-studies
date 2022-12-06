#!/usr/bin/perl

# Perl script to update computer 
# By Nicholas Grogg

# Function to run program
sub runProgram {
	## Check for distro agnostic package installs
	### Flatpak
	#### Check if flatpak installed
	#### If flatpak installed run update command 
	### Snap
	#### Check if snap installed
	#### If snap installed run update command 
	
	## Check for package managers
	### Check for apt
	if (-e "/usr/bin/apt") {
		print "Apt\n";
		system("sudo apt update && sudo apt upgrade");
		system("sudo apt autoremove");
	}
	
	### Check for yum
	elsif (-e "/usr/bin/yum") {
		print "Yum\n";
		system("sudo yum update");
		system("sudo yum autoremove");
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
