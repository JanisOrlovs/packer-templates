#!/bin/bash

set -e
set -x

if rpm -q --whatprovides kernel | grep -Fqv "$(uname -r)"; then
  rpm -q --whatprovides kernel | grep -Fv "$(uname -r)" | xargs sudo yum -y autoremove
fi

sudo rm -f /etc/ssh/ssh_host_*
sudo rm -f /var/lib/NetworkManager/*
sudo rm -rf /tmp/*
sudo yum --enablerepo=epel clean all
sudo rm -rf /var/cache/yum
sudo yum history new
sudo truncate -c -s 0 /var/log/yum.log
