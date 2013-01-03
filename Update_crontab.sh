#!/bin/sh

if [ "`whoami`" != "root" ];then
   echo "You do not have permissions to run this script"
   exit 255
fi

SCRIPT_DIR="`dirname @0`"

DELIMITOR="CRONTAB CONFIGURATION"
OLD_FILE="`tempfile -p crontab`"
NEW_FILE="`tempfile -p crontab`"
EXTENDED_DATA_FILE="`tempfile -p crontab`"

$SCRIPT_DIR/templates/crontab.sh $SCRIPT_DIR > $EXTENDED_DATA_FILE

crontab -u linserve-backup -l > $OLD_FILE

$SCRIPT_DIR/FileReplace.py "$DELIMITOR" $OLD_FILE $NEW_FILE $EXTENDED_DATA_FILE

crontab -u linserve-backup $NEW_FILE

mv $OLD_FILE /tmp/crontab.bak
echo "crontab move to /tmp/crontab.bak"

rm -f $NEW_FILE
rm -f $EXTENDED_DATA_FILE
exit 0
