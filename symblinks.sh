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

# Tmux commands
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.tmux ~/.tmux

