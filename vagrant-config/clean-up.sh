#!/usr/bin/env bash


echo "Restarting Nginx & PHP FPM"
service php5-fpm restart > /dev/null
service nginx restart > /dev/null

#echo "Removing config & install files"
#rm -Rf /vagrant/config
#rm /vagrant/build.sh
#rm /vagrant/symfony.sh
#rm /vagrant/wordpress.sh
#rm /vagrant/clean-up.sh
#rm /vagrant/README.md

#echo "Updating Vagrantfile to remove provision scripts"
#awk '!/provision/' /vagrant/Vagrantfile > /vagrant/Vagrantfile

echo "Updating .gitignore with Vagrantfile"
echo "Vagrantfile" >> /vagrant/.gitignore