#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

chown debian-transmission -R /mnt/data/Downloads
chown debian-transmission -R /mnt/data/PartialDownloads

