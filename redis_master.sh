#!/usr/bin/env bash
master_password=$1

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_redis_master" ]; then
    exit 0
fi

touch /var/vagrant_redis_master
sudo sed -i 's/bind 127.0.0.1/# Bound to 0.0.0.0/' /etc/redis/redis.conf
sudo sed -i 's/tcp-keepalive 0/tcp-keepalive 60/' /etc/redis/redis.conf
sudo sed -i 's/appendonly no/appendonly yes/' /etc/redis/redis.conf
echo "requirepass ${master_password}" | sudo tee -a /etc/redis/redis.conf
echo "maxmemory-policy noeviction" | sudo tee -a /etc/redis/redis.conf
sudo systemctl restart redis-server
