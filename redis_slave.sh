#!/usr/bin/env bash

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_redis_slave" ]; then
    exit 0
fi

touch /var/vagrant_redis_slave
sudo sed -i 's/bind 127.0.0.1/# Bound to 0.0.0.0/' /etc/redis/redis.conf
echo "requirepass s0m3th!ngr0tt3n?" | sudo tee -a /etc/redis/redis.conf
echo "slaveof local-vagrant-prodredis001.vagrant.local 6379" | \
    sudo tee -a /etc/redis/redis.conf
echo "masterauth s0m3th!ngr0tt3n?" | sudo tee -a /etc/redis/redis.conf
sudo systemctl restart redis-server