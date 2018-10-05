#!/bin/bash

# Terminal
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.bashrc ~/.bashrc
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.bash_profile ~/.bash_profile
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/custom.aliases.bash \
  ~/.bash_it/aliases/custom.aliases.bash
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/custom.plugins.bash \
  ~/.bash_it/plugins/custom.plugins.bash

# Unison
mkdir -p ~/.unison
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/default.prf ~/.unison/default.prf

# Neovim
mkdir -p ~/.config/nvim
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/nvim/init.vim ~/.config/nvim/init.vim

# Ranger
mkdir -p ~/.config/ranger
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/rc.conf ~/.config/ranger/rc.conf

# .scripts
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.scripts ~/.scripts

# # Profile
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile

# i3 config
mkdir -p ~/.config/i3/
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3-config.sh ~/.config/i3/config

# polybar
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/launch.sh ~/.config/polybar/launch.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar-config.sh ~/.config/polybar/config


