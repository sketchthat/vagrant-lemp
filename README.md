# Vagrant Provisioning
## PHP FPM, Nginx & MySQL

Provisioning script to setup a Vagrant environment. 

Base box `debian/wheezy64` with the following packages installed.

`nginx php5 php5-common php5-dev php5-cli php5-fpm curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl mysql-server composer symfony`

Optional configuration of a wordpress or symfony app nginx configuration.

##Prerequisites
This configuration expects you to have installed vagrant ([installing vagrant](https://www.vagrantup.com/docs/installation/))

##Getting Started
1. Clone the repo into your project root 
2. Uncomment one of the following lines in `Vagrantfile`

```
# Uncomment depending on which machine you want setup
#config.vm.provision :shell, path: "wordpress.sh"
#config.vm.provision :shell, path: "symfony.sh"
```

3. Run `vagrant up`
