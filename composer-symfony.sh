#!/usr/bin/env bash

echo "Installing Composer"
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
sudo php composer-setup.php --install-dir=/bin --filename=composer
php -r "unlink('composer-setup.php');"

echo "Installing Symfony Installer"
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony