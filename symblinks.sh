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
