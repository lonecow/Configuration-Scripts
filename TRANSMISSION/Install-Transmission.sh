#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

apt-get install transmission-daemon

usermod -g transmission-users debian-transmission
groupdel debian-transmission

if [ -d /etc/transmission-daemon ]; then
   cp -v `dirname $0`/transmission/* /etc/transmission-daemon/
else
   echo "Transmission-daemon doesnt seem to exist"
   exit 255
fi

chown debian-transmission /mnt/data/Downloads
chown debian-transmission /mnt/data/PartialDownloads

service transmission-daemon restart

