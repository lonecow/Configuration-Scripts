#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

#this must be done first!
./DATA/Install-Data.sh
./Create_users.sh

touch /var/log/backup_log.txt
chown linserve-backup:linserve-users /var/log/backup_log.txt

./Update_crontab.sh

usermod -a -G linserve-users rbitel
usermod -a -G transmission-users rbitel

service transmission-daemon restart

./SAMBA/Install-Samba.sh
./XBMC/Install-XBMC-Server.sh
./TRANSMISSION/Install-Transmission.sh
