#!/bin/sh

# UPDATE, UPGRADE AND DOWNLOAD SOFTWARE {{{1

sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove
sudo apt-get install -y git curl wget

# BASH_IT {{{1

# install
git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
  ~/.bash_it/install.sh --silent
# dotfiles
curl -o ~/.bash_it/aliases/custom.aliases.bash -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/custom.aliases.bash
curl -o ~/.bashrc -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/.bashrc

# TERMINAL FONTS AND SOFTWARE SETTINGS {{{1

# powerline font
cd && git clone --depth 1 https://github.com/powerline/fonts.git && \
  fonts/install.sh && \
  rm -rf fonts

# Devicon font
cd && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git && \
  cd nerd-fonts && ./install.sh DroidSansMono && cd .. && \
  rm -rf nerd-fonts

# MANAGMENT AND SYSTEM SOFTWARE {{{1

# tweak-tool
sudo apt-get install gnome-tweak-tool -y

# synaptic
sudo apt-get install synaptic -y

# psensor
sudo apt-get install psensor -y

# redshift
sudo apt-get install redshift-gtk -y

# evolution
sudo apt-get install evolution -y

# OFFICE SOFTWARE {{{1

# inkscape
sudo apt install inkscape -y

# pdf viewer
sudo apt-get install okular -y

# atom
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom -y


# SYNC SOFTWARE {{{1

# unison for bidirectional sync
sudo apt-get install unison -y

# Mendeley
wget https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
sudo dpkg -i mendeleydesktop-latest
rm mendeleydesktop-latest

# dropbox
sudo apt-get -y install python-gpg
sudo apt-get install nautilus-dropbox -y

# Gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

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

# DEVELOOPMENT SOFTWARE {{{1

# Setup docker repository
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install docker community edition
sudo apt-get update
sudo apt-get install docker-ce -y
# Add the current user to the docker group
sudo usermod -a -G docker $USER
# Verifying installation
docker run hello-world

# WEB SOFTWARE {{{1

# chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

