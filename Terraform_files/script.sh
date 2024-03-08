#!/bin/bash
sudo yum install python -y
sudo yum install unzip -y
sudo yum install git -y
sudo yum install java -y
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable Jenkins
sudo yum install nodejs -y
sudo yum install docker -y
sudo usermod -aG docker jenkins
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl restart jenkins