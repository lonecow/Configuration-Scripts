#!/bin/bash

BACKUP_LOCATION="/mnt/external/mysql-backup"

if [ ! -d $BACKUP_LOCATION ]; then
   mkdir $BACKUP_LOCATION
fi

mysqldump --opt --all-databases -u linserve-backup > $BACKUP_LOCATION/xbmc.db
