#!/bin/sh
# Profile file. Runs on login.

export PATH="$PATH:$HOME/.scripts"
export EDITOR="nvim"

[ -f ~/.bashrc ] && source ~/.bashrc
