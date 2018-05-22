#!/usr/bin/env bash

Vagrant.configure("2") do |config|
    config.vm.define "redis01" do |redis01|
        redis01.vm.box = "ubuntu/xenial64"
        redis01.vm.hostname = ENV['REDIS_MASTER_NAME']
        redis01.vm.network "private_network", ip: ENV['REDIS_MASTER_IP']
        redis01.vm.provision :shell, path: "redis_base.sh", env: {REDIS_SLAVE_IP:ENV['REDIS_SLAVE_IP'],REDIS_MASTER_IP:ENV['REDIS_MASTER_IP'],REDIS_SLAVE_NAME:ENV['REDIS_SLAVE_NAME'],REDIS_MASTER_NAME:ENV['REDIS_MASTER_NAME']}
        redis01.vm.provision "file", source: "master.redis.conf", destination: "master.redis.conf"
        redis01.vm.provision :shell, path: "redis_master.sh", env: {REDIS_MASTER_PASSWORD:ENV['REDIS_MASTER_PASSWORD']}
    end
    config.vm.define "redis02" do |redis02|
        redis02.vm.box = "ubuntu/xenial64"
        redis02.vm.hostname = ENV['REDIS_SLAVE_NAME']
        redis02.vm.network "private_network", ip: ENV['REDIS_SLAVE_IP']
        redis02.vm.provision :shell, path: "redis_base.sh", env: {REDIS_SLAVE_IP:ENV['REDIS_SLAVE_IP'],REDIS_MASTER_IP:ENV['REDIS_MASTER_IP'],REDIS_SLAVE_NAME:ENV['REDIS_SLAVE_NAME'],REDIS_MASTER_NAME:ENV['REDIS_MASTER_NAME']}
        redis02.vm.provision "file", source: "slave.redis.conf", destination: "slave.redis.conf"
        redis02.vm.provision :shell, path: "redis_slave.sh", env: {REDIS_MASTER_PASSWORD:ENV['REDIS_MASTER_PASSWORD'],REDIS_SLAVE_PASSWORD:ENV['REDIS_SLAVE_PASSWORD'],REDIS_MASTER_IP:ENV['REDIS_MASTER_IP']}
    end
end