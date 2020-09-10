#!/bin/sh

# DEVELOOPMENT SOFTWARE {{{1

# Setup docker configuration
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install docker community edition
sudo apt-get update
sudo apt-get install docker-ce -y
# Add the current user to the docker group
sudo usermod -a -G docker $USER
# Verifying installation
# docker run hello-world

