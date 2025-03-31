#!/bin/bash

# set non interactive mode to skip interactive prompts (e.g., from need restart)
export DEBIAN_FRONTEND=noninteractive
# can do-  "sudo DEBIAN_FRONTEND=noninteractive" infront of command with -y at the end

# update
sudo apt update -y 

# stop package kit 
sudo systemctl stop packagekit

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# go to location and in the curly brackets do the following,51 = line c = change sed = automatically change 
sudo sed -i '51c\proxy_pass http://localhost:3000;' /etc/nginx/sites-available/default

# restart nginx 
sudo systemctl restart nginx 

# enable nginx
sudo systemctl enable nginx 

# get app code - using github - basically cloning the repo
git clone https://github.com/Abdullahi24i/Sparta-test-app.git

# give instance an specific version of node.js to install and to install node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# go into app folder 
cd Sparta-test-app/app

# install npm 
sudo npm install 

sudo DEBIAN_FRONTEND=noninteractive npm install pm2 -g

sudo pm2 kill

sudo pm2 start app.js 

sudo pm2 startup
