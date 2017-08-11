#!/usr/bin/env bash


# Prerequisites install

#Cleanup
sudo apt-get remove -y docker docker-engine docker.io

#Docker install
sudo apt-get update -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

##prompt "Check..."

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update -y

sudo apt-get install -y docker-ce docker-compose

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl enable docker

sudo docker run hello-world
## Add prompt for pause

## GO install

sudo apt-get install -u golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin



##Node install
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install -y build-essential

#Download platform specific
sudo mkdir /usr/bin/hyperledger
cd /usr/bin/hyperledger/


sudo curl -sSL https://goo.gl/iX9dek | sudo bash
export PATH=$PATH:$PWD/bin

sudo mkdir /home/hyperledger
cd /home/hyperledger/
sudo chmod -R go=rwX,u=rwX /home/hyperledger

#sample download
git clone https://github.com/hyperledger/fabric-samples.git
cd fabric-samples/fabcar

#Install and run test app
npm install

node query.js

