#!/usr/bin/env bash
slave_password=$1
master_password=$2
master_name=$3

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_redis_slave" ]; then
    exit 0
fi

touch /var/vagrant_redis_slave
sudo sed -i 's/bind 127.0.0.1/# Bound to 0.0.0.0/' /etc/redis/redis.conf
echo "requirepass ${slave_password}" | sudo tee -a /etc/redis/redis.conf
echo "slaveof ${master_name} 6379" | \
    sudo tee -a /etc/redis/redis.conf
echo "masterauth ${master_password}" | sudo tee -a /etc/redis/redis.conf
sudo systemctl restart redis-server