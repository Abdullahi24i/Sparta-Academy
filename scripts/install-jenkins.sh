#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt update -y

sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

## **Step 2: Install Java (Required for Jenkins)**
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y

# Verify the installation:
java -version

## **Step 3: Add the Jenkins Repository and Key**
## To install the latest stable Jenkins version, add its official repository:
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

## Add the repository:
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
## Update package lists:
sudo DEBIAN_FRONTEND=noninteractive apt update -y

## Now install Jenkins with:
sudo DEBIAN_FRONTEND=noninteractive apt install jenkins -y

## Start the Jenkins service:
sudo systemctl start jenkins

## Enable it to start on boot:
sudo systemctl enable jenkins

## Check its status:
sudo systemctl status jenkins




