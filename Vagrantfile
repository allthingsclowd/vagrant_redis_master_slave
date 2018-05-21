Vagrant.configure("2") do |config|
    config.vm.define "redis01" do |redis01|
        redis01.vm.box = "ubuntu/xenial64"
        redis01.vm.hostname = "local-vagrant-prodredis001.vagrant.local"
        redis01.vm.network "private_network", ip: "192.168.1.200"
        redis01.vm.provision :shell, path: "redis_base.sh"
        redis01.vm.provision :shell, path: "redis_master.sh"
    end
    config.vm.define "redis02" do |redis02|
        redis02.vm.box = "ubuntu/xenial64"
        redis02.vm.hostname = "local-vagrant-prodredis002.vagrant.local"
        redis02.vm.network "private_network", ip: "192.168.1.201"
        redis02.vm.provision :shell, path: "redis_base.sh"
        redis02.vm.provision :shell, path: "redis_slave.sh"
    end
end