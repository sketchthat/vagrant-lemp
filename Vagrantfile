# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/wheezy64"

  config.vm.network "forwarded_port", guest: 80, host: 8013
  config.vm.network "forwarded_port", guest: 22, host: 2213

  config.vm.network "private_network", ip: "192.168.55.55"
  config.vm.synced_folder ".", "/vagrant", id: "application", :nfs => true

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell, path: "vagrant-config/build.sh"

  # Uncomment depending on which machine you want setup
  # config.vm.provision :shell, path: "vagrant-config/wordpress.sh"
  # config.vm.provision :shell, path: "vagrant-config/symfony.sh"

  config.vm.provision :shell, path: "vagrant-config/clean-up.sh"
end
