#!/bin/bash

# Check if Huawei stick is present
if [ -e /dev/sr0 ] ; then
  wvdial RDS &> /dev/null
fi

