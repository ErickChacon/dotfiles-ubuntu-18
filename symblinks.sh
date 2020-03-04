#!/bin/sh
repo_dot=$(pwd)

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
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rifle.conf ~/.config/ranger/rifle.conf

# custom scripts
path_local_bin=~/.local/bin
if [ ! -d $local_bin ]; then
    mkdir -p ~/.local
    ln -s $repo_dot/.local/bin $path_local_bin
fi

# palettes
path_palettes=~/.palettes
if [ ! -d $path_palettes ]; then
    ln -s $repo_dot/.palettes $path_palettes
fi

# # Profile
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile

# i3 config
mkdir -p ~/.config/i3/
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh ~/.config/i3/config-base.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/layouts ~/.config/i3/layouts

# polybar
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/launch.sh ~/.config/polybar/launch.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/launch.sh ~/.config/polybar/launch.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/config ~/.config/polybar/config
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar-weather ~/.config/polybar/weather




ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.palettes 

# # Profile
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile

# i3 config
mkdir -p ~/.config/i3/
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh ~/.config/i3/config-base.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/layouts ~/.config/i3/layouts

# polybar
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/launch.sh ~/.config/polybar/launch.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/launch.sh ~/.config/polybar/launch.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/config ~/.config/polybar/config
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar-weather ~/.config/polybar/weather



