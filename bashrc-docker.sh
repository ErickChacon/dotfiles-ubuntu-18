#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/rstudio/.bash_it"

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
export CPLUS_INCLUDE_PATH="/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/Rcpp/include":"/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/RcppArmadillo/include":"/home/chaconmo/R/x86_64-pc-linux-gnu-library/3.4/RcppTN/include":"/usr/share/R/include"
# export GCC_INCLUDE_DIR=/usr/share/R/include

# Load Bash It
source $BASH_IT/bash_it.sh

# Set vim navigation on terminal
set -o vi

# Fuzzy search for terminal: fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##### TRYING TO SET TERMINAL COLORS, BUT DOES NOT WORK
# export __TERM_PROF='Gruvbox'

# PROMPT_COMMAND='echo -en "\033]0;New terminal title\a"'
# PROMPT_COMMAND='echo "bla"'


# gnome-terminal --tab-with-profile=Gruvbox

# export DCONF_PROFILE="Gruvbox"

# gsettings get org.gnome.Terminal.ProfilesList list

# profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
# profile=${profile:1:-1} # remove leading and trailing single quotes
# #
# # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/"
# # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/"
# # gconftool-2 --get /apps/gnome-terminal/global/default_profile
# # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:0b23451c-161e-4cb4-8d15-e7ef40d2d697/" default-size-columns 250
#
# gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ use-theme-colors false
# gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ palette "['rgb(7,54,66)', 'rgb(255,58,54)', 'rgb(222,255,0)', 'rgb(255,193,0)', 'rgb(46,169,255)', 'rgb(255,62,155)', 'rgb(66,255,241)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(255,95,28)', 'rgb(158,255,0)', 'rgb(195,239,255)', 'rgb(194,249,255)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']"
#
# gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ palette
#
#
#
# # gconftool-2 --set --type string /apps/gnome-terminal/global/default_profile Gruvboxaa
# # gconftool-2 --set --type string /apps/gnome-terminal/global/default_profile Gruvboxaa
# # gconftool-2 --get /apps/gnome-terminal/global/default_profile
# gsettings get /apps/gnome-terminal/global/default_profile
#
# dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"

# dconf list /org/gnome/terminal/legacy/profiles:/
# dconf list /org/gnome/terminal/legacy/profiles:/:6f2c6bd9-06ab-496e-b70d-fbdc2a4ba1d4/
# dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"
# dconf reset -f /org/gnome/terminal/legacy/profiles:/PROFILE_ID
# dconf reset -f /org/gnome/terminal/legacy/profiles:/a429a555-8ed8-4923-b90f-1920d5ecc057\
#

