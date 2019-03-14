# Linux-PowerShell-AIO-Installer
All-In-One Installer for Microsoft's PowerShell *(last checked - PS6.1)* for most linux environments using the preferred Microsoft method.  Installs PS differently via ```/etc/os-release``` in Linux to determine the install method and must be an exact match.

Both scripts *should* support with the following Linux Distrobutions:
* CentOS 7
* RHEL 7
* Oracle OS 7
* Fedora (please read final output for more details)
* openSuse 47
* openSuse Leap 15
* Debian 8 & 9
* Ubuntu 14.04, 16.04, 17.10 & 18.04
* Kali

The script does not support:
* Arch
* Ubuntu 18.10
* Snap
* Binary Installs

Before executing the ```InstallAIOPowerShell.sh``` script, you may wish to install ```powershell-preview```.  Simply uncomment the install you wish and comment the other.

```bash
PS=powershell-preview
#PS="powershell"
```

To make these executable, simply:

```bash
chmod +x *.sh

# Then execute:
./InstallAIOPowerShell.sh # or
./RemoveAIOPowerShell.sh
```

*Note: These scripts tested on CentOS 7 and **UNTESTED** on all other Linux Distros. Other distrobutions were included for completeness.*

**Under MIT License, Enjoy!**
