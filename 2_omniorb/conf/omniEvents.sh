#!/bin/bash

if ! grep -q "EventService" /etc/omniORB.cfg; then
  # Lookup IP of omniORB server
  omniServerIP=$(getent hosts $nameserver | awk '{ print $1 }')

  # Reference omniORB server location
  sed -i "s/127.0.0.1/$omniServerIP/g" /etc/omniORB.cfg

  # Add omniEvents configuration
  echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" >> /etc/omniORB.cfg

  #/wait-for-it.sh $omniNames:2809
fi

echo "omniServerIP: $omniServerIP"
cat /etc/omniORB.cfg

# Start omniEvents
LOGDIR=/var/log/omniEvents
PORT=11169
rm -rf $LOGDIR
rm -rf /var/run/omniEvents.pid
mkdir -p $LOGDIR
/usr/sbin/omniEvents -f -l $LOGDIR -p $PORT -P /var/run/omniEvents.pid
