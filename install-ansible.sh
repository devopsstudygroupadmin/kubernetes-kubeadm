#!/bin/bash
sudo useradd ansibleuser
sudo echo "ansibleuser ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo amazon-linux-extras install ansible2 -y
sudo yum install docker -y
sudo systemctl enable --now docker
sudo usermod -aG docker ansibleuser
sudo mkdir /opt/kubernetes
sudo chown -R ansibleuser:ansibleuser /opt/kubernetes
sudo chmod -R 775 /opt/kubernetes
sudo hostnamectl set-hostname ansible
