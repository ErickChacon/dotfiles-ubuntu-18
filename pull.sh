#!/bin/bash
if [[ $HOSTNAME == "chaconmo-ThinkPad-L470-W10DG" ]]; then
  echo "Working at Lancaster University!"
elif [[ $HOSTNAME == "chaconmo-Precision-5510" ]]; then
  echo "Working at home!"
fi

# Terminal
cp .bashrc ~/.bashrc
cp custom.aliases.bash ~/.bash_it/aliases/custom.aliases.bash

# Neovim
cp -r nvim ~/.config/
cp -r UltiSnips ~/Documents/Nvim/

# R
sudo cp  Rprofile.site /etc/R/Rprofile.site
cp .Rprofile ~/.Rprofile
cp .ctags ~/.ctags

# Unison
mkdir ~/.unison
cp default.prf ~/.unison/default.prf

# Tmux
cp .tmux.conf ~/.tmux.conf
cp -r .tmux ~/

# Oni
mkdir ~/.oni
cp oni-config.js ~/.oni/config.js
