#https://www.howtoforge.com/tutorial/install-apache-with-php-and-mysql-on-ubuntu-16-04-lamp/
#https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-16-04
#setup ubuntu server commands
#I'm running all the steps in this tutorial with root privileges, so make sure you're logged in as root:
#https://jakelprice.com/article/how-to-upgrade-from-php-70-to-php-71
#go to
#sudo su

#1. for update server
#sudo apt-get update
sudo apt-get update && apt-get upgrade

#2. Install Apache Web Server
sudo apt-get -y install apache2

#3. Install PHP 7
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get install php7.1 php7.1-common

#Then restart Apache:
systemctl restart apache2

#4. Get MySQL / MariaDB support in PHP
#Pick the ones you need and install them like this:
sudo apt-get install php7.1-curl php7.1-xml php7.1-zip php7.1-gd php7.1-mysql php7.1-mbstring
#Now restart Apache2:
systemctl restart apache2

#5. Install the Opcache + APCu PHP cache to speed up PHP
	#Opcache and APCu can be installed as follows:
sudo apt-get -y install php7.1-opcache php-apcu
#Now restart Apache2:
systemctl restart apache2




#9. Install phpMyAdmin
sudo apt-get -y install phpmyadmin

#10 folder permission
sudo chmod -R 777 /var/www/html
#for permissions

#for htaccess
sudo chmod -R 777 /etc/apache2/apache2.conf
nano /etc/apache2/apache2.conf

#zip/ unzip
sudo apt install zip
sudo apt install unzip



