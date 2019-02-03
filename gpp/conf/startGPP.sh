#!/bin/bash

# Determine domain name (default is REDHAWK_DEV)
domainname=${domainname:-REDHAWK_DEV}

# Generate a unique GPP nodee
defaultnode="Gpp_$(hostname)"
nodename=${nodename:-$defaultnode}
/var/redhawk/sdr/dev/devices/GPP/cpp/gpp_setup --nodename=$nodename

# Launch GPP node
exec /usr/local/redhawk/core/bin/nodeBooter -d /var/redhawk/sdr/dev/nodes/$nodename/DeviceManager.dcd.xml \
                                            --domainname $domainname
