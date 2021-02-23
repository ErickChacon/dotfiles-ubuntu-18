#!/bin/sh
# from https://github.com/retorquere/zotero-deb

wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | sudo bash
sudo apt update
sudo apt install zotero

# ZOTERO_VERSION="5.0.95"
# ZOTERO_URL="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version="$ZOTERO_VERSION
#
# URL="https://download.zotero.org/Zotero-5.095_linux-x86_64.tar.bz2"

# wget $ZOTERO_URL

# echo $ZOTERO_URL

# # install from from source
# apt-get install -y libevent-dev libncurses-dev build-essential
# curl -sL \
#     https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz | \
#     tar xz && \
#     cd tmux-${TMUX_VERSION} && \
#     ./configure && make && \
#     make install
#
# # clean
# cd .. && \
#   rm -rf tmux-${TMUX_VERSION}
#
# # setup italic and true color
# # && \
# #   # italic and true color
# #   tic xterm-256color-italic.terminfo && \
# #   rm xterm-256color-italic.terminfo
# #
# # # COPY xterm-256color-italic.terminfo .
