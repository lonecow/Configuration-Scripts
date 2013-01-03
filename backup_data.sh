#!/bin/bash

CURRENT_DIR=`dirname $0`

if [ -z "$CURRENT_DIR" ]; then
	CURRENT_DIR='pwd'
fi

BACKUP_LOG="$CURRENT_DIR/backup_log.txt"

#first we are going to check if both the data and external mounts exist
DATA_MOUNTED="FALSE"
if [ -n "`mount | grep /mnt/data`" ]
then
	DATA_MOUNTED="TRUE"
fi

EXTERNAL_MOUNTED="FALSE"
if [ -n "`mount | grep /mnt/external | grep -v /mnt/external2`" ]
then
	EXTERNAL_MOUNTED="TRUE"
fi

if [ ${DATA_MOUNTED} = "TRUE" -a ${EXTERNAL_MOUNTED} ]
then
	echo "[`date`] Backup Started" >> $BACKUP_LOG
	echo "Starting Bakup"
	rsync -azv --exclude="lost+found" /mnt/data/ /mnt/external/bkup >> $BACKUP_LOG
	echo "Done"
	echo "[`date`] Backup Complete" >> $BACKUP_LOG
fi
