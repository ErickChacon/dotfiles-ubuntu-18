#!/bin/sh
# from https://github.com/retorquere/zotero-deb

wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
sudo apt update
sudo apt install zotero
