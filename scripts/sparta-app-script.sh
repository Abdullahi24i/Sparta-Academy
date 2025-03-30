#!/bin/bash

# set non interactive mode to skip interactive prompts (e.g., from need restart)
export DEBIAN_FRONTEND=noninteractive

# update
sudo apt update -y 

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx 
sudo systemctl restart nginx 

# enable nginx
sudo systemctl enable nginx 

# get app code 
scp -i tech503-Abdullahi-aws-key.pem nodejs20-sparta-test-app ec2-ubuntu@[ipv4-public].eu-west-1.compute.amazonaws.com:/home/ubuntu/

# install unzip file 
sudo apt install unzip 

# unzip file 
sudo unzip nodejs20-sparta-test-app.zip

# give instance an specific version of node.js to install and to install node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# go into app folder 
cd app

# install npm 
npm install / sudo npm install 

# start app 
sudo npm start app.js

#stop package kit 
sudo systemctl stop packagekit

