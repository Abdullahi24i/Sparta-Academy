#!/bin/bash


# Download and install any packages that need updating and any common packages 
sudo apt update -y

#upgrade packages being used
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y 

# commands from https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

# install gnupg and curl just in-case they're not thesudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yre
sudo DEBIAN_FRONTEND=noninteractive apt install gnupg curl -y

# Add the GPG key from documentation
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# Create sources list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#Update the package list again according to the list- i.e want mongodb 7.0 not the latest
sudo apt update -y

# Install Mongo DB packages
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6
 
# check status of mongo db
sudo systemctl status mongod

# change config of network interfaces: bindIp from 12.0.0.1 to 0.0.0.0 like on AWS
cd /etc

sudo nano mongod.conf

#start mongo db
sudo systemctl start mongod

# check status 
sudo systemctl status mongod



#TO CONNECT TO DATABASE 
# go to app bash window 
# change env variable 
#export DB_HOST=mongodb://<db-ip-address>:27017/posts
#printenv DBHOST to check env variable
# sudo npm install 
#node seeds/seed.js 
# pm2 start app.js 

