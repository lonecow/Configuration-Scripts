#!/bin/bash

BACKUP_LOCATION="/mnt/external/mysql-backup"

mysql -u linserve-backup < $BACKUP_LOCATION/xbmc.db
