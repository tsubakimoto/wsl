# Setup Docker on WSL2
# https://docs.docker.com/engine/install/ubuntu/#installation-methods

#!/bin/bash
set -xe

sudo apt-get update -y

sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install -y \
  docker-ce docker-ce-cli \
  containerd.io \
  docker-compose-plugin

sudo usermod -aG docker $USER

sudo service docker start
