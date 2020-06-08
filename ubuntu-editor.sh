#!/bin/sh

# tmux

xterm-256color-italic.terminfo .
tmux_v="3.0a"
apt-get install -y \
  # dependencies
  libevent-dev libncurses-dev build-essential && \
  # install
  curl -sL \
  https://github.com/tmux/tmux/releases/download/${tmux_v}/tmux-${tmux_v}.tar.gz | \
  tar xz && \
  cd tmux-${tmux_v} && \
  ./configure && make && \
  make install && \
  # remove files
  cd .. && \
  rm -rf tmux-${tmux_v} && \
  # italic and true color
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo

# Neovim {{{1

neovim_version=0.4.3
RUN \
  # requirements
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags && \
  # requirements to build from source
  apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake \
  g++ pkg-config  && \
  curl -sL https://github.com/neovim/neovim/archive/v${neovim_version}.tar.gz | \
  tar xz && \
  cd neovim-${neovim_version} && \
  # install
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  # remove files
  cd .. && \
  rm -rf neovim-${neovim_version}
