#!/bin/bash
PORT=${OMNIEVENTS_PORT:-11169}
LOGDIR=/var/log/omniEvents
PIDFILE=/var/run/omniEvents.pid

# Clean environment for omniEvents
rm -rf $PIDFILE
rm -rf $LOGDIR
mkdir -p $LOGDIR

# Start omniEvents
exec /usr/sbin/omniEvents -f -l $LOGDIR -p $PORT -P $PIDFILE
