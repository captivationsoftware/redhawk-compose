#!/bin/bash
node=/var/redhawk/sdr/dev/nodes/RTLNode/DeviceManager.dcd.xml

# Determine domain name (default is REDHAWK-COMPOSE)
domainname=${domainname:-REDHAWK_COMPOSE}
debug=${debug:-3}
uuid=${HOSTNAME:-$(uuidgen)}
group_id=${group_id:-}
digital_agc_enable=${digital_agc_enable:-0}
frequency_correction=${frequency_correction:-0}
bias_enable=${bias_enable:-0}

sed -i "s/%domainname%/$domainname/g" $node 
sed -i "s/%uuid%/$uuid/g" $node 
sed -i "s/%group_id%/$group_id/g" $node
sed -i "s/%digital_agc_enable%/$digital_agc_enable/g" $node
sed -i "s/%frequency_correction%/$frequency_correction/g" $node
sed -i "s/%bias_enable%/$bias_enable/g" $node

# Launch RTL node
echo "Launching RTL node $uuid"
exec /usr/local/redhawk/core/bin/nodeBooter -d $node --domainname $domainname -debug $debug

