#!/usr/bin/env bash

echo "Provisioning machine"
apt-get update > /dev/null

echo "Adding Ondrej/php5"
echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list.d/dotdeb.list
echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list.d/dotdeb.list
wget http://www.dotdeb.org/dotdeb.gpg -O- | apt-key add – 
apt-get update > /dev/null

echo "Installing Nginx"
apt-get install -y nginx > /dev/null

echo "Installing PHP 5.6"
apt-get install php5 php5-common php5-dev php5-cli php5-fpm -y --force-yes > /dev/null

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-intl -y --force-yes > /dev/null

echo "Installing debconf"
apt-get install debconf-utils -y > /dev/null

debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"

echo "Installing Mysql Server"
apt-get install mysql-server -y > /dev/null

echo "Installing Mysql"
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -ppassword  mysql

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
php composer-setup.php
php -r "unlink('composer-setup.php');"
