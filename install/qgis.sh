#!/bin/sh

# prerequisites
sudo apt-get install -y gnupg software-properties-common
# add key
wget -qO - https://qgis.org/downloads/qgis-2020.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
# add repository
sudo add-apt-repository "deb https://qgis.org/debian `lsb_release -c -s` main"
# install
sudo apt update && \
    sudo apt-get install -y qgis python-qgis qgis-plugin-grass

# # diconnected islands plugin requirements
# pip3 install networkx --user
