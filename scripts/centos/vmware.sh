#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

sudo yum -y install perl
sudo yum -y install net-tools
sudo yum -y install make
sudo yum -y install gcc
sudo yum -y install kernel-devel
sudo yum -y install open-vm-tools