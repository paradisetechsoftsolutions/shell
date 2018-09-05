#Upgrade installed packages
sudo apt-get update

#Install NGINX
sudo apt-get install nginx

#Open Firewall for HTTP/HTTPS
sudo ufw allow 'Nginx Full'

#Install MySQL
sudo apt-get install mysql-server

#MySQL on Ubuntu 18.04

sudo mysql ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<root>';

#Install Node.js

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash 

#Finally install Node.js
sudo apt-get install -y nodejs

#Install Ghost-CLI
sudo npm i -g ghost-cli
sudo npm install -g ghost-cli@latest

Create a new folder
sudo mkdir -p /var/www/ghost

sudo chmod 777 /var/www/ghost

cd /var/www/ghost

#Install Ghost (using Ghost-CLI)
ghost install


sudo chown root:root /var/www/ghost
