#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=~/.bash_it
export BASH_IT_CUSTOM=~/Documents/Repositories/dotfiles-ubuntu-18/.bash_it/custom

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='cupcake'
export BASH_IT_THEME='zork'
# export BASH_IT_THEME='bobby'
# export BASH_IT_THEME='axin'
# export BASH_IT_THEME='brainy'
# export BASH_IT_THEME='nwinkler_random_colors'
# export BASH_IT_THEME='powerline-multiline'
# export BASH_IT_THEME='powerline-naked'


# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
#export SCM_CHECK=true
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

export TERM=xterm-256color-italic

# openblas set number of threads
export OPENBLAS_NUM_THREADS=4

# r headers
export CPLUS_INCLUDE_PATH=/usr/share/R/include

# export CPATH=/usr/share/R/include
# export C_INCLUDE_PATH=/usr/share/R/include
# export CPLUS_INCLUDE_PATH="/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include":"/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/RcppArmadillo/include":"/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/RcppTN/include":"/usr/share/R/include"
export CPLUS_INCLUDE_PATH="$HOME/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include":"$HOME/R/x86_64-pc-linux-gnu-library/3.4/RcppArmadillo/include":"$HOME/R/x86_64-pc-linux-gnu-library/3.4/RcppTN/include":"/usr/share/R/include"
# export GCC_INCLUDE_DIR=/usr/share/R/include


# Load Bash It
source $BASH_IT/bash_it.sh

# Set vim navigation on terminal
set -o vi

# Fuzzy search for terminal: fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export EDITOR="nvim"
export BROWSER="firefox"
# export col=#aaff77
# source ~/.shortcuts
