#!/bin/sh

if [ "`whoami`" != "root" ];then
   echo "You do not have permissions to run this script"
   exit 255
fi

SCRIPT_DIR="`dirname $0`"

DELIMITOR="FSTAB CONFIGURATION"
OLD_FILE="/etc/fstab"
NEW_FILE="`tempfile -p fstab`"
EXTENDED_DATA_FILE="`tempfile -p fstab`"

$SCRIPT_DIR/templates/fstab.sh > $EXTENDED_DATA_FILE

$SCRIPT_DIR/../FileReplace.py "$DELIMITOR" $OLD_FILE $NEW_FILE $EXTENDED_DATA_FILE

mv $OLD_FILE /tmp/fstab.bak
echo "fstab move to /tmp/fstab.bak"
cp $NEW_FILE $OLD_FILE

rm -f $NEW_FILE
rm -f $EXTENDED_DATA_FILE
exit 0
