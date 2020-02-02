#!/bin/sh

# UPDATE, UPGRADE AND DOWNLOAD SOFTWARE {{{1

sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove
sudo apt-get install -y git curl wget

# MANAGMENT AND SYSTEM SOFTWARE {{{1

# tweak-tool
sudo apt-get install -y gnome-tweak-tool chrome-gnome-shell

# synaptic
sudo apt-get install synaptic -y

# psensor
sudo apt-get install psensor -y

# redshift
sudo apt-get install redshift-gtk -y

# OFFICE SOFTWARE {{{1

# inkscape
sudo apt install inkscape -y

# pdf viewer
sudo apt-get install okular -y

# neovim
sudo apt-get install -y neovim

# qgis
echo -e "\n## Mirror for qgis" | sudo tee -a /etc/apt/sources.list && \
  sudo add-apt-repository "deb https://qgis.org/ubuntu bionic main"
wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add -
sudo apt-get update && \
  sudo apt-get install -y qgis python-qgis qgis-plugin-grass

# diconnected islands plugin requirements
pip3 install networkx --user


# SYNC SOFTWARE {{{1

# unison for bidirectional sync
sudo apt-get install unison -y
# dotfiles
curl -o ~/.unison/default.prf -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/default.prf

# dropbox
sudo apt-get -y install python-gpg
sudo apt-get install nautilus-dropbox -y

# teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
rm teamviewer_amd64.deb

# ENTERTAINMENT SOFTWARE {{{1

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys \
  931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | \
  sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y

# DESIGN SOFTWARE {{{1

# color picker
sudo apt-get install gpick -y

# WEB SOFTWARE {{{1

# chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# CUSTOM {{{1

# numix
sudo add-apt-repository ppa:numix/ppa && \
  sudo apt-get update && \
  sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle
