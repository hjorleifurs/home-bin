#!/bin/sh

#when bind mounting /usr/share to some other place it breaks grub themes
#this is an ugly fix for that shit


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


[ -d '/home2/tmp' ] && echo does exist || mkdir /home2/tmp

mount --bind / /home2/tmp

rsync -uva /usr/share/grub/ /home2/tmp/usr/share/grub/

wait

umount /home2/tmp

echo now you can reboot to check if this worked or destroid your computer
