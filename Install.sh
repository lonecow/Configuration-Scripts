#!/bin/bash

createDirectories()
{
   directories="/mnt/data /mnt/external /mnt/external2"
   for directory in $directories; do
      if [ ! -d $directory ]; then
         mkdir -p $directory
      fi
   done
}

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

createDirectories

./Create_users.sh

touch /var/log/backup_log.txt
chown linserve-backup:linserve-users /var/log/backup_log.txt

./Update_fstab.sh
./Update_crontab.sh

sudo mount -a

usermod -a -G linserve-users rbitel
usermod -a -G transmission-users rbitel

service transmission-daemon restart

./SAMBA/Install-Samba.sh
./XBMC/Install-XBMC-Server.sh
./TRANSMISSION/Install-Transmission.sh
