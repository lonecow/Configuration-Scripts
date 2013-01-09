#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

#this must be done first!
./DATA/Install-Data.sh

usermod -a -G linserve-users rbitel
usermod -a -G transmission-users rbitel

./BACKUP/Install-Backup.sh
./SAMBA/Install-Samba.sh
./XBMC/Install-XBMC-Server.sh
./TRANSMISSION/Install-Transmission.sh
