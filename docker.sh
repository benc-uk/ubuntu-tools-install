#!/bin/bash 
set -e 

echo "Installing Docker client tools into /usr/local/bin/"

dockerVer="18.09.1"
machineVer="0.16.1"
composeVer="1.23.2"

echo "docker"
curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-$dockerVer.tgz -o /tmp/docker.tgz
tar -zxvf /tmp/docker.tgz docker/docker
chmod +x docker/docker
sudo mv docker/docker /usr/local/bin/docker
rmdir docker/

echo "docker-machine"
curl -sSL https://github.com/docker/machine/releases/download/v$machineVer/docker-machine-`uname -s`-`uname -m` -o /tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

echo "dotnet"
curl -sSL https://github.com/docker/compose/releases/download/$composeVer/docker-compose-`uname -s`-`uname -m` -o /tmp/docker-compose
chmod +x /tmp/docker-compose
sudo cp /tmp/docker-compose /usr/local/bin/docker-compose

