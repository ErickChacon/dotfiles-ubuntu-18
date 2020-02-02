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

# Devicon font (this is very slow)
cd && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git && \
  cd nerd-fonts && ./install.sh DroidSansMono && cd .. && \
  rm -rf nerd-fonts

# italic and true color
curl -OL \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/docker/xterm-256color-italic.terminfo && \
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo


# MANAGMENT AND SYSTEM SOFTWARE {{{1

# tweak-tool
sudo apt-get install -y gnome-tweak-tool chrome-gnome-shell

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

# pdfunite and pdfseparate
sudo apt-get install poppler-utils -y

# # atom
# sudo add-apt-repository ppa:webupd8team/atom -y
# sudo apt-get update
# sudo apt-get install atom -y

# neovim
sudo apt-get install -y neovim

# ranger file explorer
sudo apt-get install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo
ranger --copy-config=all

# Devicon plugin
cd && git clone --depth 1 https://github.com/alexanderjeurissen/ranger_devicons.git && \
  cd ranger_devicons && make install && cd .. && \
  rm -rf ranger_devicons

# ext pdf, has okular,   X, flag f = okular -- "$@"

# # emacs
# sudo apt-get install -y emacs
# sudo apt-get install -y ess

# qgis
echo -e "\n## Mirror for qgis" | sudo tee -a /etc/apt/sources.list && \
  sudo add-apt-repository "deb https://qgis.org/ubuntu bionic main"
wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add -
sudo apt-get update && \
  sudo apt-get install -y qgis python-qgis qgis-plugin-grass

# diconnected islands plugin requirements
pip3 install networkx --user

# skype
wget https://go.skype.com/skypeforlinux-64.deb
# sudo apt-get install -y skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb

# email client
sudo apt-get install -y neomutt

# setting up neomutt
# sudo apt-get install -y isync msmtp pass postfix
# git clone https://github.com/LukeSmithxyz/mutt-wizard
# cd mutt-wizard
# sudo make install
# mw add
# pass init eral.th07@gmail.com

# Error in /usr/share/mutt-wizard/mutt-wizard.muttrc, line 48: Function 'goto-parent' not available for menu 'browser'
# Error in /home/chaconmo/.config/mutt/muttrc, line 2: source: file /usr/share/mutt-wizard/mutt-wizard.muttrc could not be sourced.
# bind browser h goto-parent
# Comment following line on /usr/bin/mailsync
# pgrep -u "$USER" >/dev/null || exit

# i3-gaps {{{1

# requirements
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
sudo apt-get install -y i3status

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# cat > /etc/ld.so.conf.d/i3.conf

# for dmenu
sudo apt install suckless-tools

# configure with gnome
sudo apt-get install -y gnome-flashback
git clone https://github.com/csxr/i3-gnome.git
cd i3-gnome
sudo make install
# install -m0644 -D session/i3-gnome-xsession.desktop //usr/share/xsessions/i3-gnome.desktop
# install -m0644 -D session/i3-gnome.desktop //usr/share/applications/i3-gnome.desktop
# install -m0644 -D session/i3-gnome.session //usr/share/gnome-session/sessions/i3-gnome.session
# install -m0755 -D session/i3-gnome //usr/bin/i3-gnome
# install -m0755 -D session/gnome-session-i3 //usr/bin/gnome-session-i3

# for wallpaper
sudo apt-get install -y feh

# polybar
sudo apt-get install -y cmake xcb-proto libxcb-randr0-dev libxcb-ewmh-dev python-xcbgen \
  wireless-tools

# modules
sudo apt-get install -y libxcb-xkb-dev libdssialsacompat0 libdssialsacompat-dev libpulse-dev \
  libjsoncpp-dev libmpdclient-dev libmpdclient2 libcurl4 libnl-genl-3-dev

git clone --branch 3.2 --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
make userconfig
polybar example

# font-awesome
sudo apt-get install -y fonts-font-awesome
sudo apt-get install -y gucharmap

# i3 locks
sudo apt-get install -y i3lock imagemagick scrot

# SYNC SOFTWARE {{{1

# unison for bidirectional sync
sudo apt-get install unison -y
# dotfiles
curl -o ~/.unison/default.prf -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/default.prf

# Mendeley
wget https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
sudo dpkg -i mendeleydesktop-latest
rm mendeleydesktop-latest

# dropbox
sudo apt-get -y install python-gpg
sudo apt-get install nautilus-dropbox -y

# Gitkraken

sudo apt-get install -y libgnome-keyring0
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

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
# docker run hello-world

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
