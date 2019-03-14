#!/bin/bash
#
# removeAIOPowerShell.sh
# All-In-One PowerShell removal tool if using prefered method of install
# see https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6
# original scripts and installation detals
#
#
# MIT Licence (c) 2018 Ron Cotton
#
# removal of: install method in installAIOPowerShell.sh
# All-In-One preferred linux installer for powershell
# Non-Interactive
#
# Note:	Attempts to remove "powershell" and/or "powershell-preview" for
# 		systems that have been installed using the preferred method
#
# TODO: improve logic to shorten scripting

# sources os-release - populates variables in bash for OS information
. /etc/os-release

if [ $ID == "centos" ] || [ $ID == "rhel" ] || [ $ID == "ol" ] ; then
	if [ ${VERSION_ID:0:1} == "7" ] ; then
		sudo yum -y remove powershell
		sudo yum -y remove powershell-preview
	fi
fi

if [ $ID == "fedora" ] ; then
	sudo dnf remove powershell -y
	sudo dnf remove powershell-preview -y
fi

if [ $ID == "debian" ] && [ $VERSION_ID == "8" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "debian" ] && [ $VERSION_ID == "9" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "14.04" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "16.04" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "17.10" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "ubuntu" ] && [ $VERSION_ID == "18.04" ] ; then
	sudo apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi

if [ $ID == "opensuse-leap" ] && [ $VERSION_ID == *"15"* ] ; then
	rm -rf /usr/bin/pwsh /opt/microsoft/powershell
fi

if [ $ID == "opensuse" ] && [ $VERSION_ID == *"42"* ] ; then
	rm -rf /usr/bin/pwsh /opt/microsoft/powershell
fi

if [ $ID == "raspbian" ] ; then
	rm -rf ~/powershell
fi

if  [ $ID == "kali" ] ; then
	# Uninstall PowerShell package
	apt-get remove -y powershell
	sudo apt-get remove -y powershell-preview
fi
