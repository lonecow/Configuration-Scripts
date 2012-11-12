#!/bin/bash


if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

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

