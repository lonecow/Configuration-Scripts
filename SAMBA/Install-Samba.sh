#!/bin/bash

if [ "`whoami`" != "root" ]; then
   echo "You do not have permissions to execute this command"
   exit 255
fi

apt-get install samba

if [ -d /etc/samba/ ]; then
  cp -v `dirname $0`/samba/* /etc/samba/
else
   echo "samba doesnt seem to exist"
   exit 255
fi

service smbd restart
service nmbd restart
service smbd stop
service nmbd stop

`dirname $0`/RestoreSambaDb.sh

service smbd start
service nmbd start

