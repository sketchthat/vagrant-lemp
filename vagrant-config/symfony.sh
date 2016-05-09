#!/usr/bin/env bash

echo "Installing Symfony Installer"
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

echo "Config Symfony"
sudo ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony