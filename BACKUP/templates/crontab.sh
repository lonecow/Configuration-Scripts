#!/bin/sh
echo "0 3 * * * `readlink -f $1 | xargs dirname`/BACKUP/backup_data.sh > /dev/null
0 3 * * * `readlink -f $1 | xargs dirname`/XBMC/BackupDatabases.sh > /dev/null"
