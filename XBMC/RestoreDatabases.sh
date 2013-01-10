#!/bin/bash

BACKUP_LOCATION="/mnt/external/mysql-backup"

mysqldump -u linserve-backup < $BACKUP_LOCATION/xbmc.db
