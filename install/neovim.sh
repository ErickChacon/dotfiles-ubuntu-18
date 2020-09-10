#!/bin/sh

NEOVIM_VERSION=0.4.3

# requirements
apt-get install -y python-pip python3-pip && \
    pip2 install neovim && \
    pip3 install neovim && \
    apt-get install -y ruby ruby-dev && \
    gem install neovim && \
    apt-get install -y exuberant-ctags

# install from from source
apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake \
    g++ pkg-config  && \
    curl -sL https://github.com/neovim/neovim/archive/v${NEOVIM_VERSION}.tar.gz | \
    tar xz && \
    cd neovim-${NEOVIM_VERSION} && \
    make CMAKE_BUILD_TYPE=Release && \
    make install

# remove files
cd .. && \
    rm -rf neovim-${NEOVIM_VERSION}

# neovim requirements
pip3 install --user msgpack
pip3 install --user pynvim
# pip3 install --user --upgrade pynvim
