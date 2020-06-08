#!/bin/sh

vimplug_v="518a356"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/${vimplug_v}/plug.vim

