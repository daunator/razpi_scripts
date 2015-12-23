#!/bin/bash

# Kill reverse ssh
REVSSHD_PID=$(pgrep -f "ssh -fNT -R :9091:localhost:22 x@x")
kill $REVSSHD_PID

# Kill wvdial
WVDIAL_PID=$(pgrep wvdial)
sudo kill -SIGINT $WVDIAL_PID

if [[ $1 == "reboot" ]] ; then
  sudo reboot
else
  sudo halt
fi
