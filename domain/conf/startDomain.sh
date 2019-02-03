#!/bin/bash
  
# Determine domain name (default is REDHAWK_DEV)
domainname=${domainname:-REDHAWK_DEV}

exec /usr/local/redhawk/core/bin/nodeBooter -D --domainname $domainname 
