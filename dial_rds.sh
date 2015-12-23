#!/bin/bash

# Check if Huawei stick is present
if [ ! -e /dev/sr0 ] ; then
  >&2 echo "Error: modem not present"
  exit 1
elif pgrep wvdial &> /dev/null ; then
  >&2 echo "Error: already connected"
  exit 2
else 
  sudo wvdial RDS &
  # Wait until all info is displayed
  sleep 8
  exit 0
fi

