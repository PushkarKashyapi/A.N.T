!/bin/bash

read -p 'please enter target user:' USER

read -p 'please enter target ip address:' IP


sudo dnf install epel-release -y

sudo dnf install ansible -y

sudo dnf install sshd -y


ssh-keygen -t rsa -b 2048

ssh-copy-id "$USER@$IP"

