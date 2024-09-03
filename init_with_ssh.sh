#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

sudo adduser kwazzart
sudo usermod -aG sudo kwazzart

sudo mkdir -p /home/kwazzart/.ssh
sudo cp /root/.ssh/authorized_keys /home/kwazzart/.ssh/
sudo chown -R kwazzart:kwazzart /home/kwazzart/.ssh
sudo chmod 700 /home/kwazzart/.ssh
sudo chmod 600 /home/kwazzart/.ssh/authorized_keys
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh
