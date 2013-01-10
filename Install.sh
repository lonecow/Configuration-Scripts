#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

#this must be done first!
`dirname $0`/DATA/Install-Data.sh

usermod -a -G linserve-users rbitel
usermod -a -G transmission-users rbitel

`dirname $0`/BACKUP/Install-Backup.sh
`dirname $0`/SAMBA/Install-Samba.sh
`dirname $0`/XBMC/Install-XBMC-Server.sh
`dirname $0`/TRANSMISSION/Install-Transmission.sh
