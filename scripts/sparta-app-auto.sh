#!/bin/bash

# set non interactive mode to skip interactive prompts (e.g., from need restart)
export DEBIAN_FRONTEND=noninteractive
# can do-  "sudo DEBIAN_FRONTEND=noninteractive" infront of command with -y at the end

# update
sudo DEBIAN_FRONTEND=noninteractive apt update -y 

# upgrade
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo apt install nginx -y

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

pm2 kill

export DB_HOST=mongodb://0.0.0.0:27017/posts

node seeds/seed.js 

pm2 start app.js 

pm2 startup


# start app 
#sudo npm start app.js & 
#bg

# can do `nohup node app.js`
# to start the app and keep it running even after the exiting terminal

# to kill any processes running in the background - if you run it multiple times it won'r crash (idempotency)

# idempotency is an operation that will produce the same result over and over again



---
- name: Deploy Node.js App with Nginx and PM2
  hosts: app
  become: true

  vars:
    app_repo: "https://github.com/Abdullahi24i/Sparta-test-app.git"
    app_base_dir: "/home/ubuntu/Sparta-test-app"
    app_dir: "/home/ubuntu/Sparta-test-app/app"
    nodejs_setup_url: "https://deb.nodesource.com/setup_20.x"
    db_host: "mongodb://0.0.0.0:27017/posts"

  tasks:

    - name: Ensure non-interactive mode for apt
      # Prevents prompts from packages like tzdata
      ansible.builtin.shell: echo "export DEBIAN_FRONTEND=noninteractive" >> /etc/environment

    - name: Update apt cache
      # Refresh the list of available packages
      ansible.builtin.apt:
        update_cache: yes

    - name: Upgrade all installed packages
      # Installs available upgrades (non-interactive)
      ansible.builtin.apt:
        upgrade: dist

    - name: Install Nginx
      # Installs the Nginx web server
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Restart Nginx
      # Restart to apply any changes or fix issues
      ansible.builtin.service:
        name: nginx
        state: restarted

    - name: Enable Nginx on boot
      # Ensures Nginx starts on system boot
      ansible.builtin.service:
        name: nginx
        enabled: yes

    - name: Clone the app repository from GitHub
      # Clones the Node.js app into a directory
      ansible.builtin.git:
        repo: "{{ app_repo }}"
        dest: "{{ app_base_dir }}"
        force: yes

    - name: Download Node.js setup script
      # Adds the Node.js 20.x repo to apt sources
      ansible.builtin.get_url:
        url: "{{ nodejs_setup_url }}"
        dest: /tmp/nodesource_setup.sh
        mode: '0755'

    - name: Run Node.js setup script
      # Executes the script to enable Node.js 20 repo
      ansible.builtin.command: bash /tmp/nodesource_setup.sh

    - name: Install Node.js
      # Installs Node.js from Nodesource
      ansible.builtin.apt:
        name: nodejs
        state: present

    - name: Install app dependencies using npm
      # Runs `npm install` in the app directory
      ansible.builtin.command: npm install
      args:
        chdir: "{{ app_dir }}"

    - name: Install PM2 globally using npm
      # PM2 manages Node.js apps in production
      ansible.builtin.npm:
        name: pm2
        global: true

    - name: Kill any running PM2 processes (optional)
      # Useful before starting new ones
      ansible.builtin.command: pm2 kill
      ignore_errors: yes

    - name: Export DB_HOST environment variable
      # Needed by the seeding script
      ansible.builtin.shell: |
        echo 'export DB_HOST={{ db_host }}' >> ~/.bashrc
        export DB_HOST={{ db_host }}
      environment:
        DB_HOST: "{{ db_host }}"

    - name: Run seed.js to seed the MongoDB database
      # Populates the DB with initial data
      ansible.builtin.command: node seeds/seed.js
      args:
        chdir: "{{ app_dir }}"
      environment:
        DB_HOST: "{{ db_host }}"

    - name: Start the app using PM2
      # Launches app.js via PM2
      ansible.builtin.command: pm2 start app.js
      args:
        chdir: "{{ app_dir }}"

    - name: Enable PM2 startup on reboot
      # Ensures PM2 restarts apps when system reboots
      ansible.builtin.command: pm2 startup

    - name: Save current PM2 process list
      # Saves the app list for auto-restore
      ansible.builtin.command: pm2 save
