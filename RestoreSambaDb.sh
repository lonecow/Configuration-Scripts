#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

SCRIPT_PATH=`dirname $0`
for file in `ls $SCRIPT_PATH/samba-dbs/*.tdb`; do
   FILENAME=`basename $file`
   tdbrestore /var/lib/samba/${FILENAME}2 < $file
   cat /var/lib/samba/${FILENAME}2 > /var/lib/samba/$FILENAME
   rm -f /var/lib/samba/${FILENAME}2
done
