#!/usr/bin/env bash

master_ip=ENV['REDIS_MASTER_IP']
master_name=ENV['REDIS_MASTER_NAME']
slave_ip=ENV['REDIS_SLAVE_IP']
slave_name=ENV['REDIS_SLAVE_NAME']
master_password=ENV['REDIS_MASTER_PASSWORD']
slave_password=ENV['REDIS_SLAVE_PASSWORD']

Vagrant.configure("2") do |config|
    config.vm.define "redis01" do |redis01|
        redis01.vm.box = "ubuntu/xenial64"
        redis01.vm.hostname = "#{master_name}"
        redis01.vm.network "private_network", ip: "#{master_ip}"
        redis01.vm.provision :shell, path: "redis_base.sh", args: "#{slave_ip} #{master_ip} #{slave_name} #{master_name}"
        redis01.vm.provision :shell, path: "redis_master.sh", args: "#{master_password}"
    end
    config.vm.define "redis02" do |redis02|
        redis02.vm.box = "ubuntu/xenial64"
        redis02.vm.hostname = "#{slave_name}"
        redis02.vm.network "private_network", ip: "#{slave_ip}"
        redis02.vm.provision :shell, path: "redis_base.sh", args: "#{slave_ip} #{master_ip} #{slave_name} #{master_name}"
        redis02.vm.provision :shell, path: "redis_slave.sh", args: "#{slave_password} #{master_password} #{master_name}"
    end
end