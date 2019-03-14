#!/bin/bash
#
# installAIOPowerShell.sh
# All-In-One preferred linux installer for powershell
# Non-Interactive
#
# see https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6
# original scripts and installation detals.
#
# MIT Licence (c) 2018 Ron Cotton
#
# Install for: 	CentOS 7, RHEL 7, Fedora, openSUSE 47, openSUSE Leap 15, 
#				Debian 8 & 9, Ubuntu 14.04, 16.04, 17.04, 18.04, Kali,
#				Raspbian & Oracle Linux 7.
#
# Script does not install:	unofficial Arch, Ubuntu 18.10, Snap, or Binary Archives
# 
# Notes:	Arch is experiemental and therefore not included
#
# TODO: Testing on all distros (script only tested on CentOS)
# 		add linking for raspbian -- allowing pwsh vs. ~/powershell/pwsh
#		improve logic to shorten script

# sources os-release - populates variables in bash for OS information
. /etc/os-release

# use either "powershell" or "powershell-preview" depending on desired
# powershell release.
# Note:	"powershell-preview" is only available only for CentOS, RHEL,
# 		Oracle Linux, Fedora, Debian, Ubuntu & Kali.  Changing this
#		variable for other releases makes no change to the install of
#		PS6.1
# !!! Uncomment the release you wish to install and comment the release
# !!! you wish to install.  Note: powershell-preview is experimental.
#PS="powershell-preview"
PS="powershell"

if [ $ID == "centos" ] || [ $ID == "rhel" ] || [ $ID == "ol" ] ; then
	if [ ${VERSION_ID:0:1} == "7" ] ; then
		# Powershell dependencies
		yum -y install libunwind libcurl openssl-libs libicu

		# Register the Microsoft RedHat repository
		curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

		# Install PowerShell
		sudo yum install -y $PS
	fi
fi

if [ $ID == "fedora" ] ; then
	# Install powershell dependencies
	sudo dnf install -y libunwind libcurl openssl-libs libicu compat-openssl10

	# Register the Microsoft signature key
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

	# Register the Microsoft RedHat repository
	curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

	# Update the list of products
	sudo dnf update

	# Install PowerShell
	sudo dnf install -y $PS
	
	if [ $VERSION_ID == *"28"* ] ; then
		echo "Fedora 28 may require TERM=term pwsh as a workaround - see https://github.com/PowerShell/PowerShell/issues/6838"
	fi
fi

if [ $ID == "debian" ] && [ $VERSION_ID == "8" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.0 libicu52

	# Install system components
	sudo apt-get update
	sudo apt-get install curl apt-transport-https

	# Import the public repository GPG keys
	curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

	# Register the Microsoft Product feed
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-jessie-prod jessie main" > /etc/apt/sources.list.d/microsoft.list'

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "debian" ] && [ $VERSION_ID == "9" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.2 libicu57
	
	# Install system components
	sudo apt-get update
	sudo apt-get install -y curl gnupg apt-transport-https

	# Import the public repository GPG keys
	curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

	# Register the Microsoft Product feed
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "14.04" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.0 libicu52

	# Download the Microsoft repository GPG keys
	wget -q https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb

	# Register the Microsoft repository GPG keys
	sudo dpkg -i packages-microsoft-prod.deb

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "16.04" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.0 libicu55
	
	# Download the Microsoft repository GPG keys
	wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb

	# Register the Microsoft repository GPG keys
	sudo dpkg -i packages-microsoft-prod.deb

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "17.10" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.0 libicu57

	# Download the Microsoft repository GPG keys
	wget -q https://packages.microsoft.com/config/ubuntu/17.10/packages-microsoft-prod.deb

	# Register the Microsoft repository GPG keys
	sudo dpkg -i packages-microsoft-prod.deb

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "18.04" ] ; then
	# Install powershell dependencies
	sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 libcurl3 libunwind8 libuuid1 zlib1g libssl1.0.0 libicu60
	
	# Download the Microsoft repository GPG keys
	wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

	# Register the Microsoft repository GPG keys
	sudo dpkg -i packages-microsoft-prod.deb

	# Update the list of products
	sudo apt-get update

	# Install PowerShell
	sudo apt-get install -y $PS
fi

if [ $ID == "opensuse-leap" ] && [ $VERSION_ID == *"15"* ] ; then
	# Install powershell dependencies
	zypper update && zypper --non-interactive install curl libcurl4 tar gzip libopenssl1_0_0 libicu60_2

	# Download the powershell '.tar.gz' archive
	curl -L https://github.com/PowerShell/PowerShell/releases/download/v6.1.0/powershell-6.1.0-linux-x64.tar.gz -o /tmp/powershell.tar.gz

	# Create the target folder where powershell will be placed
	mkdir -p /opt/microsoft/powershell/6.1.0

	# Expand powershell to the target folder
	tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/6.1.0

	# Set execute permissions
	chmod +x /opt/microsoft/powershell/6.1.0/pwsh

	# Create the symbolic link that points to pwsh
	ln -s /opt/microsoft/powershell/6.1.0/pwsh /usr/bin/pwsh
fi

if [ $ID == "opensuse" ] && [ $VERSION_ID == *"42"* ] ; then
	# Install dependencies
	zypper update && zypper --non-interactive install curl libcurl4 libopenssl1_0_0 tar libicu52_1

	# Download the powershell '.tar.gz' archive
	curl -L https://github.com/PowerShell/PowerShell/releases/download/v6.1.0/powershell-6.1.0-linux-x64.tar.gz -o /tmp/powershell.tar.gz

	# Create the target folder where powershell will be placed
	mkdir -p /opt/microsoft/powershell/6.1.0

	# Expand powershell to the target folder
	tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/6.1.0

	# Set execute permissions
	chmod +x /opt/microsoft/powershell/6.1.0/pwsh

	# Create the symbolic link that points to pwsh
	ln -s /opt/microsoft/powershell/6.1.0/pwsh /usr/bin/pwsh
fi

if [ $ID == "raspbian" ] ; then
	# Install prerequisites
	sudo apt-get install -y libunwind8

	# Grab the latest tar.gz
	wget https://github.com/PowerShell/PowerShell/releases/download/v6.1.0/powershell-6.1.0-linux-arm32.tar.gz

	# Make folder to put powershell
	mkdir ~/powershell

	# Unpack the tar.gz file
	tar -xvf ./powershell-6.1.0-linux-arm32.tar.gz -C ~/powershell
fi

if  [ $ID == "kali" ] ; then
	# Download & Install prerequisites
	wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-9_amd64.deb
	dpkg -i libicu57_57.1-9_amd64.deb
	apt-get update && apt-get install -y curl gnupg apt-transport-https

	# Add Microsoft public repository key to APT
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

	# Add Microsoft package repository to the source list
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" | tee /etc/apt/sources.list.d/powershell.list

	# Install PowerShell package
	apt-get update && apt-get install -y $PS
fi
echo "type 'pwsh' or 'pwsh-preview' to start powershell!"
echo "(~/powershell/pwsh for raspbian)"
