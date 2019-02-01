#!/bin/bash

if ! grep -q "EventService" /etc/omniORB.cfg; then
  # Lookup IP of omniORB server
  nameserverIP=$(getent hosts $nameserver | awk '{ print $1 }') || $NAMESERVER_IP
  eventserverIP=$(getent hosts $eventserver | awk '{ print $1 }') || $EVENTSERVER_IP

  if [ ! -z "$nameserverIP" ]; then
    # Reference omniORB server location
    echo "Configuring nameserver with IP $nameserverIP"
    sed -i "s/127.0.0.1/$nameserverIP/g" /etc/omniORB.cfg
  fi

  if [ ! -z "$eventserverIP" ]; then
    # Add omniEvents configuration
    echo "Configuring eventserver with IP $eventserverIP"
    echo "InitRef = EventService=corbaloc::$eventserverIP:11169/omniEvents" >> /etc/omniORB.cfg
  fi
fi

exec /usr/local/redhawk/core/bin/nodeBooter -d /var/redhawk/sdr/dev/nodes/GppNode/DeviceManager.dcd.xml
