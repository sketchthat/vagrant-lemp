# Vagrant Provisioning
### PHP FPM, Nginx & MySQL

Basic provision script for Vagrant 2.

Will setup a base box which has Nginx config for Wordpress or Symfony apps.

Clone the repo and run update the `build.sh` script - uncomment one of the following lines

```
# Uncomment depending on which machine you want to build
#echo "Config Wordpress"
#sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress

#echo "Config Symfony"
#sudo ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony
```

`vagrant up` 
