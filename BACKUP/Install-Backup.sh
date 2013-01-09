#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

addgroup --system linserve-backup
useradd --system --shell /bin/false -g linserve-backup linserve-backup

usermod -a -G transmission-users linserve-backup
usermod -a -G linserve-users linserve-backup

touch /var/log/backup_log.txt
chown linserve-backup:linserve-users /var/log/backup_log.txt

chown linserve-backup -R /mnt/external

`dirname $0`/Update_crontab.sh

