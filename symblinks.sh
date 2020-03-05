#!/bin/sh
# This scripts creates symbolinks for the dotfiles.

# paths

path_dotfiles=$(pwd)
path_bashrc=~/.bashrc
path_bash_prof=~/.bash_profile
path_local_bin=~/.local/bin
path_palettes=~/.palettes
path_unison=~/.unison/default.prf
path_nvim=~/.config/nvim

# overwrite dotfiles

overwrite=${1:-false}
if [ $overwrite = true ]; then
    rm -r $path_bashrc $path_bash_prof $path_local_bin \
        $path_palettes $path_unison $path_nvim
fi

# bash

if [ ! -f $path_bashrc ]; then
    ln -s $path_dotfiles/.bashrc $path_bashrc
fi

if [ ! -f $path_bash_prof ]; then
    ln -s $path_dotfiles/.bash_profile $path_bash_prof
fi

if [ ! -d $local_bin ]; then
    mkdir -p ~/.local
    ln -s $path_dotfiles/.local/bin $path_local_bin
fi

if [ ! -d $path_palettes ]; then
    ln -s $path_dotfiles/.palettes $path_palettes
fi

# unison

if [ ! -L $path_unison ] && [ ! -f $path_unison ]; then
    mkdir -p ~/.unison
    ln -s $path_dotfiles/.unison/default.prf $path_unison
fi

# neovim

if [ ! -d $path_nvim ]; then
    mkdir -p ~/.config
    ln -s $path_dotfiles/.config/nvim $path_nvim
fi

# # Ranger
# mkdir -p ~/.config/ranger
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rc.conf ~/.config/ranger/rc.conf
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rifle.conf ~/.config/ranger/rifle.conf
#
# # # Profile
# # ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile

# i3 config
mkdir -p ~/.config/i3/
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh ~/.config/i3/config-base.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/layouts ~/.config/i3/layouts

# polybar
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/launch.sh ~/.config/polybar/launch.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/launch.sh ~/.config/polybar/launch.sh
ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/config ~/.config/polybar/config
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar-weather ~/.config/polybar/weather

#
#
#
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.palettes 
#
# # # Profile
# # ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile
#
# # i3 config
# mkdir -p ~/.config/i3/
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh ~/.config/i3/config-base.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/layouts ~/.config/i3/layouts
#
# # polybar
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/launch.sh ~/.config/polybar/launch.sh
# # ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/launch.sh ~/.config/polybar/launch.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar/config ~/.config/polybar/config
# # ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/polybar-weather ~/.config/polybar/weather
#
#
#
