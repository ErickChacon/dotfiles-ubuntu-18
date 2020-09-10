# !/bin/sh
# This scripts creates symbolinks for the dotfiles.

# define software paths

path_dotfiles=$(pwd)
echo $path_dotfiles
path_bashrc=~/.bashrc
path_bash_prof=~/.bash_profile
path_bash_it=~/.bash
path_local_bin=~/.local/bin
path_palettes=~/.palettes
path_unison=~/.unison/default.prf
path_nvim=~/.config/nvim
path_bspwm=~/.config/bspwm
path_sxhkdrc=~/.config/sxhkd/sxhkdrc
path_polybar=~/.config/polybar
path_dwm=~/.config/dwm
path_tmux=~/.tmux.conf
path_tmux_proj=~/.config/tmux


# overwrite dotfiles

overwrite=${1:-false}
if [ $overwrite = true ]; then
    rm -rf $path_bashrc $path_bash_prof $path_local_bin \
        $path_palettes $path_unison $path_nvim $path_bspwm \
        $path_sxhkdrc $path_polybar $path_dwm $path_tmux
fi

# bash

if [ ! -f $path_bashrc ]; then
    ln -s $path_dotfiles/.bashrc $path_bashrc
fi

if [ ! -f $path_bash_prof ]; then
    ln -s $path_dotfiles/.bash_profile $path_bash_prof
fi

if [ ! -d $path_local_bin -o -z "$(ls -A "$path_local_bin")" ]; then
    mkdir -p ~/.local
    rm -rf ~/.local/bin
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

# tmux

if [ ! -L $path_tmux ] && [ ! -f $path_tmux ]; then
    ln -s $path_dotfiles/.tmux.conf $path_tmux
fi

if [ ! -d $path_tmux_proj ]; then
    mkdir -p ~/.config
    ln -s $path_dotfiles/.config/tmux $path_tmux_proj
fi


# bspwm

if [ ! -d $path_bspwm ]; then
    mkdir -p ~/.config
    ln -s $path_dotfiles/.config/bspwm $path_bspwm
fi

if [ ! -L $path_sxhkdrc ] && [ ! -f $path_sxhkdrc ]; then
    mkdir -p ~/.config/sxhkd
    ln -s $path_dotfiles/.config/sxhkd/sxhkdrc $path_sxhkdrc
fi

# polybar

if [ ! -d $path_polybar ]; then
    mkdir -p ~/.config
    ln -s $path_dotfiles/.config/polybar $path_polybar
fi

# dwm

if [ ! -d $path_dwm ]; then
    mkdir -p ~/.config
    ln -s $path_dotfiles/.config/dwm $path_dwm
fi

# # Ranger
# mkdir -p ~/.config/ranger
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rc.conf ~/.config/ranger/rc.conf
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/ranger/rifle.conf ~/.config/ranger/rifle.conf
#
# # # Profile
# # ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/.profile ~/.profile
#
# # i3 config
# mkdir -p ~/.config/i3/
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh ~/.config/i3/config-base.sh
# ln -s ~/Documents/Repositories/dotfiles-ubuntu-18/i3/layouts ~/.config/i3/layouts
#

#
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
