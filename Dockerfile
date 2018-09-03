
# Download base image goespatial {{{1

FROM rocker/geospatial

# Software for installation {{{1

RUN apt-get install -y git curl wget

# Tmux {{{1

# dependencies
RUN apt-get install -y libevent-dev libncurses-dev build-essential

# install
RUN curl -sL https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz | \
  tar xz && \
  cd tmux-2.7 && \
  ./configure && make && \
  make install && \
  cd .. && \
  rm -rf tmux-2.7

# italic and true color
RUN curl -OL \
  https://github.com/ErickChacon/dotfiles-ubuntu/raw/master/xterm-256color-italic.terminfo && \
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo

# Neovim {{{1

# backport mirror for neovim > 2.0.0
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" | \
  tee -a /etc/apt/sources.list

# requirements
RUN apt-get update && \
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags

# install
# RUN apt-get install -y neovim exuberant-ctags
RUN apt-get -t stretch-backports -y install "neovim"


# Add my user {{{1

# ARG user1=chaconmo
# RUN useradd -ms /bin/bash $user1
# RUN usermod -a -G staff $user1
# USER $user1
# WORKDIR /home/$user1

ARG user1=rstudio
ARG home_user1=/home/$user1
USER $user1
WORKDIR /home/$user1

# User configuration: terminal settings and dotfiles {{{1

# bash-it
RUN git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
  ~/.bash_it/install.sh --silent

# vim plugin manager
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins for neovim
RUN mkdir -p ~/.config/nvim/ && \
  curl -o ~/.config/nvim/init.vim -L \
  https://github.com/ErickChacon/dotfiles-ubuntu/raw/master/nvim/init-docker.vim && \
  nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# bash_it configuration
RUN echo "export BASH_IT_THEME='zork'" | \
  tee -a .bashrc


# # Dotfiles
# RUN git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu-18.git && \
#   cd dotfiles-ubuntu && chmod +x pull-docker.sh && ./pull-docker.sh && cd .. && \
#   rm -rf dotfiles-ubuntu

# USER root

# USER $user1
# RUN nvim plop.R --headless '+call StartR("R")' +qall

# USER rstudio
# USER root
