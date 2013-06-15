#!/bin/bash
echo -e
echo -e
YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
echo -e $RED"================Kali-Cleaner========================================"$ENDCOLOR
echo -e $RED"=      Little cleaner for Kali by MasterButcher [:]                ="$ENDCOLOR
echo -e $RED"===================================================================="$ENDCOLOR
echo -e
echo -e
                                                                                                                                                                                                                                         
OLDCONF=$(dpkg -l|grep "^rc"|awk '{print $2}')
CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
LINUXPKG="linux-(image|headers|debian-modules|restricted-modules)"
METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
#OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)
YELLOW="\033[1;33m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"
 
if [ $USER != root ]; then
echo -e $RED"[Kali-cleaner]:Error: must be root"
echo -e $YELLOW"[Kali-cleaner]:Exiting..."$ENDCOLOR
exit 0
fi
 
echo -e $YELLOW"[Kali-cleaner]:Cleaning apt cache..."$ENDCOLOR
sudo aptitude clean
 
echo -e $YELLOW"[Kali-cleaner]:Removing old config files..."$ENDCOLOR
sudo aptitude purge $OLDCONF
 
echo -e $YELLOW"[Kali-cleaner]:Removing old kernels..."$ENDCOLOR
sudo aptitude purge $OLDKERNELS
 
echo -e $YELLOW"[Kali-cleaner]:Emptying every trashes..."$ENDCOLOR
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
 
echo -e $YELLOW"[Kali-cleaner]:Script Finished!"$ENDCOLOR
echo -e
echo -e $RED"Goodbye........."$ENDCOLOR
