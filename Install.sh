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

apt-get install transmission-daemon
apt-get install samba

cd `dirname $0`

if [ -d /etc/transmission-daemon ]; then
   cp -v ./transmission/* /etc/transmission-daemon/
else
   echo "Transmission-daemon doesnt seem to exist"
   exit 255
fi

if [ -d /etc/samba/ ]; then
  cp -v ./samba/* /etc/samba/
else
   echo "samba doesnt seem to exist"
   exit 255
fi

service smbd resart
service transmission-daemon restart

createDirectories
