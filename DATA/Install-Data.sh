#!/bin/bash

createDirectories()
{
   directories="/mnt/data /mnt/external /mnt/external2"
   for directory in $directories; do
      if [ ! -d $directory ]; then
         mkdir -p $directory
      fi
   done
}

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

createDirectories

addgroup --system linserve-users
addgroup --system transmission-users

`dirname $0`/Update_fstab.sh

sudo mount -a

