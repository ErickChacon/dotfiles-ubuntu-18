#!/bin/bash

# if [[ $HOSTNAME == "chaconmo-ThinkPad-L470-W10DG" ]]; then
#   echo "Working at Lancaster University!"
# elif [[ $HOSTNAME == "chaconmo-Precision-5510" ]]; then
#   echo "Working at home!"
# fi

# Terminal
cp .bashrc ~/.bashrc
cp custom.aliases.bash ~/.bash_it/aliases/custom.aliases.bash

# Neovim
mkdir -p ~/.config/nvim/
# cp -r nvim ~/.config/
cp nvim/init.vim ~/.config/nvim/init.vim
# cp -r UltiSnips ~/Documents/Nvim/

# # R
# cp  Rprofile.site /etc/R/Rprofile.site
# cp .Rprofile ~/.Rprofile
# cp .ctags ~/.ctags

# # Unison
# mkdir -p ~/.unison
# cp default.prf ~/.unison/default.prf

# Tmux
cp .tmux.conf ~/.tmux.conf
cp -r .tmux ~/

# # Oni
# mkdir -p ~/.oni
# cp oni-config.js ~/.oni/config.js
