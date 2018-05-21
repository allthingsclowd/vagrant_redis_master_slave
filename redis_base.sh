#!/usr/bin/env bash
slave_ip=$1
master_ip=$2
slave_name=$3
master_name=$4


# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_redis_base" ]; then
    exit 0
fi

touch /var/vagrant_redis_base
echo "${master_ip}     ${master_name}" >> /etc/hosts
echo "${slave_ip}     ${slave_name}" >> /etc/hosts
sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y redis-server