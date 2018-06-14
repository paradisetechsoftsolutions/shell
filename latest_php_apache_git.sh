#install apache and php
#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ubuntu 16.04 Dev Server
# Run like - bash install_lamp.sh
# Script should auto terminate on errors

echo -e "\e[96m Adding PPA  \e[39m"
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

echo -e "\e[96m Installing apache  \e[39m"
sudo apt-get -y install apache2


echo -e "\e[96m Installing php  \e[39m"
sudo apt-get -y install php7.1 libapache2-mod-php7.1 

# Install some php exts
sudo apt-get -y install curl mcrypt php7.1-mysql php7.1-mcrypt php7.1-curl php7.1-json php7.1-mbstring php7.1-gd php7.1-intl php7.1-xml php7.1-zip php-gettext 
#sudo apt-get -y install php-xdebug
sudo phpenmod mcrypt
sudo phpenmod curl

# Enable some apache modules
sudo a2enmod rewrite
#sudo a2enmod headers

echo -e "\e[96m Restart apache server to reflect changes  \e[39m"
sudo service apache2 restart

echo -e "\e[96m Installing mysql server \e[39m"
echo -e "\e[93m User: root, Password: root \e[39m"

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.7

### Run next command on production server
#sudo mysql_secure_installation

# Download and install composer 
echo -e "\e[96m Installing composer \e[39m"
# Notice: Still using the good old way
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


# Check php version
php -v

# Check apache version
apachectl -v

# Check mysql version
mysql --version

# Check if php is working or not
php -r 'echo "\nYour PHP installation is working fine.\n";'

# Fix composer folder permissions
#sudo chown -R $USER $HOME/.composer

# Check composer version
composer --version

echo -e "\e[92m Open http://localhost/ to check if apache is working or not. \e[39m"

# Clean up cache
sudo apt-get clean








#install phpmyadmin

#!/bin/bash
# Script will auto terminate on errors
set -euo pipefail
IFS=$'\n\t'

# Ubuntu 16.04, apache2.4, php 7.x
# Run like - bash install_phpmyadmin.sh
# You should have MySQL pre-installed


echo -e "\e[96m Begin silent install phpMyAdmin \e[39m"

# Add phpMyAdmin PPA for latest version
# Warning!!! Don't add this PPA if you are running php v5.6
sudo add-apt-repository -y ppa:nijel/phpmyadmin
sudo apt-get update

echo -e "\e[93m User: root, Password: root \e[39m"
# Set non-interactive mode
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'﻿

sudo apt-get -y install phpmyadmin

# Restart apache server
sudo service apache2 restart

# Clean up
sudo apt-get clean

echo -e "\e[92m phpMyAdmin installed successfully \e[39m"
echo -e "\e[92m Remember: password for root user is root \e[39m"









#install git

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Script will auto terminate on errors
# run like - bash script_name.sh


# Install latest git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git gitk

# My Git Configs
git config --global --add merge.ff false
git config --global push.followTags true
git config --global core.autocrlf false
git config --global push.default simple
git config --global color.ui auto
git config --global branch.autosetuprebase always
git config --global core.compression 9
git config --global credential.helper 'cache --timeout 28800'
git config --global core.filemode false
git config --global core.editor "nano"
git config --global core.excludesfile '~/.gitignore'

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.logout 'credential-cache exit'

# Clean up
sudo apt-get clean

# Check for git version
git --version
