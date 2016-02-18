# Vagrant Provisioning
### PHP 5.7 / FPM, Nginx & MySQL

Basic provision script for Vagrant 2.

Will setup a base box which has Nginx config for Wordpress or Symfony apps.

##Prerequisites
This configuration expects you to have installed vagrant ([installing vagrant](https://www.vagrantup.com/docs/installation/))

##Getting Started
1. Clone the repo into your project root 
2. Uncomment one of the following lines in `build.sh`

```
# Uncomment depending on which machine you want to build
#echo "Config Wordpress"
#sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress

#echo "Config Symfony"
#sudo ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony
```

3. Run `vagrant up`
