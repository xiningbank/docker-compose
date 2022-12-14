#!/bin/bash

# update system
sudo apt-get update

# install docker on ubuntu, see: https://docs.docker.com/engine/install/ubuntu
apt-get install docker.io -y

# add docker repository for China
cat daemon.json >> /etc/docker/daemon.json
systemctl restart docker

# add alias as command for docker
cat .bashrc >> ~/.bashrc
source ~/.bashrc

# install docker-compose
# for versions, see: https://github.com/docker/compose/releases
cp .env.example .env
. .env
apt-get install curl -y
curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
