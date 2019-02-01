#!/bin/bash
  
# Lookup IP of omniORB server
nameserverIP=$(getent hosts $nameserver | awk '{ print $1 }')
eventserverIP=$(getent hosts $eventserver | awk '{ print $1 }')

# Apply safe defaults (loopback) if unable to determine
nameserverIP=${nameserverIP:-127.0.0.1}
eventserverIP=${eventserverIP:-127.0.0.1}

# Configure omniORB
cat > /etc/omniORB.cfg << EOL
InitRef = NameService=corbaname::$nameserverIP:2809
InitRef = EventService=corbaloc::$eventserverIP:11169/omniEvents
supportBootstrapAgent = 1
EOL

echo "--- /etc/omniORB.cfg -----------------------------------------------"
cat /etc/omniORB.cfg
echo "--------------------------------------------------------------------"

exec /usr/local/redhawk/core/bin/nodeBooter -D
