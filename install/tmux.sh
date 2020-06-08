#!/bin/sh

TMUX_VERSION="3.0a"

# install from from source
apt-get install -y libevent-dev libncurses-dev build-essential
curl -sL \
    https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz | \
    tar xz && \
    cd tmux-${TMUX_VERSION} && \
    ./configure && make && \
    make install

# clean
cd .. && \
  rm -rf tmux-${TMUX_VERSION}

# setup italic and true color
# && \
#   # italic and true color
#   tic xterm-256color-italic.terminfo && \
#   rm xterm-256color-italic.terminfo
#
# # COPY xterm-256color-italic.terminfo .
