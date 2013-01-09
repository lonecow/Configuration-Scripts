#!/bin/sh
echo "0 3 * * * `readlink -f $1`/backup_data.sh > /dev/null
0 3 * * * `readlink -f $1`/XBMC/BackupDatabases.sh > /dev/null"
