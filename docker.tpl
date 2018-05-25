#!/bin/bash
sudo apt-get update -y
sudo apt-get  upgrade -y
export DEBIAN_FRONTEND=noninteractive
echo "127.0.0.1 $HOSTNAME" | sudo tee -a   /etc/hosts
echo 'export PS1="\[\033[0;34m\][\u:\h\[\033[0;35m\]:\w]\[\033[0;39m\]\n\[\033[0;33m\]\342\226\210\342\226\210\[\033[0;39m\]"' >> /home/ubuntu/.bashrc
sudo apt-get remove docker docker-engine docker.io -y
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual -y

sudo apt-get update -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install docker-ce -y
sudo groupadd docker
sudo usermod -aG docker ubuntu

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
