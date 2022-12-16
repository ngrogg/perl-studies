#!/usr/bin/perl

# Perl script to update computer 
# By Nicholas Grogg

# Function to run program
sub runProgram {
	## Check for distro agnostic package installs
	### Flatpak
	print "Checking if flatpak installed\n";
	print "-----------------------------------------\n";
	#### Check if flatpak installed
	if (-e "/usr/bin/flatpak") {
		print "flatpak detected - updating";
		print "-----------------------------------------\n";
		#### If flatpak installed run update command 
		system("flatpak update");
	}
	### Snap
	#### Check if snap installed
	print "Checking if snap installed\n";
	print "-----------------------------------------\n";
	if (-e "/usr/bin/snap") {
		print "snap detected - updating";
		print "-----------------------------------------\n";
		#### If snap installed run update command 
		system("sudo snap refresh");
	}
	
	## Check for package managers
	### Check for apt
	if (-e "/usr/bin/apt") {
		print "Apt package manager detected\n";
		print "-----------------------------------------\n";
		system("sudo apt update && sudo apt upgrade");
		system("sudo apt autoremove");
	}
	
	### Check for yum
	elsif (-e "/usr/bin/yum") {
		print "Yum package manager detected\n";
		print "-----------------------------------------\n";
		system("sudo yum update");
		system("sudo yum autoremove");
	}

	### Check for pacman
	elsif (-e "/usr/bin/pacman") {
		print "pacman package manager detected\n";
		print "-----------------------------------------\n";
		system("sudo pacman -Syu");
	}

	### Check for zypper
	elsif (-e "/usr/bin/zypper") {
		print "zypper package manager detected\n";
		print "-----------------------------------------\n";
		system("sudo zypper update");
	}

	### Else something else 
	else {
		print "ISSUE"
		print "-----------------------------------------\n";
		print "update manually";
	}
}

# Run the program function
runProgram();
