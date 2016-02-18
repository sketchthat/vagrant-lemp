# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/wheezy64"

  config.vm.network "forwarded_port", guest: 80, host: 8010
  config.vm.network "forwarded_port", guest: 22, host: 2210

  config.vm.network "private_network", ip: "192.168.55.55"
  config.vm.synced_folder ".", "/vagrant", id: "application", :nfs => true

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell, path: "build.sh"
  config.vm.provision :shell, path: "composer-symfony.sh"
  config.vm.provision :shell, path: "clean-up.sh"
end
