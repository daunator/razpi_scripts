#!/bin/bash

# Check if connection is dialed
WVDIAL_PID=$(pgrep wvdial)
re='^[0-9]+$'
if [[ $WVDIAL_PID =~ $re ]] ; then
  sleep 15 # wait for the connection 
  ssh -fNT -R :9091:localhost:22 x@x
fi 

