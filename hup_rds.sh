#!/bin/bash

# Check if connection is dialed
WVDIAL_PID=$(pgrep wvdial)
re='^[0-9]+$'
if [[ $WVDIAL_PID =~ $re ]] ; then
  sudo kill -SIGINT $WVDIAL_PID
  sleep 1
  exit 0
else
  >&2 echo "Error: no active connection found"
  exit 1
fi 

