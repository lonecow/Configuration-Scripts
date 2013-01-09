#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

SCRIPT_PATH=`dirname $0`
for file in `ls /var/lib/samba/*.tdb`; do
   FILENAME=`basename $file`
   tdbdump $file > $SCRIPT_PATH/samba-dbs/$FILENAME
done
