#!/usr/bin/env bash

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_redis_base" ]; then
    exit 0
fi

touch /var/vagrant_redis_base
echo "192.168.1.200     local-vagrant-prodredis001.vagrant.local" >> /etc/hosts
echo "192.168.1.201     local-vagrant-prodredis002.vagrant.local" >> /etc/hosts
sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y redis-server