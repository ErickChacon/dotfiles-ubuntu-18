#!/bin/bash
if [[ $HOSTNAME == "chaconmo-ThinkPad-L470-W10DG" ]]; then
  echo "Working at Lancaster University!"
elif [[ $HOSTNAME == "chaconmo-Precision-5510" ]]; then
  echo "Working at home!"
fi

# Terminal
cp ~/.bashrc .bashrc
cp ~/.bash_it/aliases/custom.aliases.bash custom.aliases.bash

# Neovim
cp -rT ~/.config/nvim nvim
cp -rT ~/Documents/Nvim/UltiSnips UltiSnips

# R
cp /etc/R/Rprofile.site Rprofile.site
cp ~/.Rprofile .Rprofile
cp ~/.ctags .ctags

# Unison
cp ~/.unison/default.prf default.prf

# Tmux
cp ~/.tmux.conf .tmux.conf
cp -rT ~/.tmux .tmux

# Oni
cp ~/.oni/config.js oni-config.js
