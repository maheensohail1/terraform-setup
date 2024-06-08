#!/bin/bash

# Update package index
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx service to start on boot
sudo systemctl enable nginx

# install nodejs 20
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

#install docker
sudo apt-get install docker.io -y

sudo systemctl start docker

sudo systemctl enable docker

# sudo apt update
# sudo apt install fontconfig openjdk-17-jre

# sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
#   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
#   https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#   /etc/apt/sources.list.d/jenkins.list > /dev/null

# sudo apt-get update
# sudo apt-get install jenkins
# sudo systemctl start jenkins
# sudo systemctl enable jenkins



