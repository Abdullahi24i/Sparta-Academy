#!/bin/bash
sleep 20
cd home/ubuntu/app
export DB_HOST=mongodb://DB-IP-Address:port/posts
sudo npm install
node seeds/seed.js
pm2 start app.js