#!/bin/bash

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

# get app code - cannot use scp! can't run on local machine 
