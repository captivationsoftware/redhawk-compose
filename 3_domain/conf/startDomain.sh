#!/bin/bash

if ! grep -q "EventService" /etc/omniORB.cfg; then
  # Lookup IP of omniORB server
  nameserverIP=$(getent hosts $nameserver | awk '{ print $1 }')
  eventserverIP=$(getent hosts $eventserver | awk '{ print $1 }')

  # Reference omniORB server location
  sed -i "s/127.0.0.1/$nameserverIP/g" /etc/omniORB.cfg

  # Add omniEvents configuration
  echo "InitRef = EventService=corbaloc::$eventserverIP:11169/omniEvents" >> /etc/omniORB.cfg
fi

/usr/local/redhawk/core/bin/nodeBooter --help
exec /usr/local/redhawk/core/bin/nodeBooter -D
