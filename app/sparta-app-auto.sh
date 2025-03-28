#!/bin/bash

# set non interactive mode to skip interactive prompts (e.g., from need restart)
export DEBIAN_FRONTEND=noninteractive

# update
sudo apt update -y 

# stop package kit 
sudo systemctl stop packagekit

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx 
sudo systemctl restart nginx 

# enable nginx
sudo systemctl enable nginx 

# get app code - using github
git clone https://github.com/Abdullahi24i/sparta-test-app.git

# give instance an specific version of node.js to install and to install node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# go into app folder 
cd sparta-test-app/app

# install npm 
sudo npm install 

# start app 
sudo npm start app.js & 
bg

#