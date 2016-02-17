#!/usr/bin/env bash

echo "Provisioning machine"
apt-get update > /dev/null

echo "Installing Nginx"
apt-get install -y nginx > /dev/null

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl php-apc -y > /dev/null

echo "Installing debconf"
apt-get install debconf-utils -y > /dev/null

debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"

echo "Installing Mysql Server"
apt-get install mysql-server -y > /dev/null

echo "Config PHP Timezone & FPM Fix Path"
echo "date.timezone = UTC" >> /etc/php5/fpm/php.ini
echo "date.timezone = UTC" >> /etc/php5/cli/php.ini

echo "cgi.fix_pathinfo=0" >> /etc/php5/fpm/php.ini

echo "Config Nginx"
sudo cp /vagrant/config/symfony_nginx /etc/nginx/sites-available/symfony > /dev/null
sudo cp /vagrant/config/wordpress_nginx /etc/nginx/sites-available/wordpress > /dev/null
sudo rm /etc/nginx/sites-available/default > /dev/null
sudo rm /etc/nginx/sites-enabled/default > /dev/null

echo "Installing Composer"
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Uncomment depending on which machine you want to build
#echo "Config Wordpress"
#sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress

#echo "Config Symfony"
#sudo ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony
#

echo "Restarting Nginx & PHP FPM"
service php5-fpm restart > /dev/null
service nginx restart > /dev/null

echo "Updating .gitignore"
echo "config/" >> /vagrant/.gitignore
echo "build.sh" >> /vagrant/.gitignore