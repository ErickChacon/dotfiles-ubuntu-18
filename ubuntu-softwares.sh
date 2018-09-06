#source ~/.bashrc!/bin/sh

# UPDATE AND UPGRADE {{{1
sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove

# SOFTWARE FOR INSTALLATION {{{1
sudo apt-get install -y git curl wget


# BASH_IT {{{1

# install
git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
  ~/.bash_it/install.sh --silent
# dotfiles
curl -o ~/.bash_it/aliases/custom.aliases.bash -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/docker/custom.aliases.bash
curl -o ~/.bashrc -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/.bashrc
curl -o ~/.bash_profile -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/docker/.bash_profile

# TMUX {{{1

# dependencies
sudo apt-get install libevent-dev libncurses-dev build-essential -y

# install
curl -sL https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz | tar xz && \
  cd tmux-2.7 && \
  ./configure && make && \
  sudo make install && \
  cd .. && \
  rm -rf tmux-2.7

# italic and true color
curl -OL https://github.com/ErickChacon/dotfiles-ubuntu/raw/master/xterm-256color-italic.terminfo && \
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo

# dotfiles
curl -o ~/.tmux.conf -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/docker/.tmux.conf

# NEOVIM {{{1

# requirements
sudo apt-get install -y software-properties-common python-pip python3-pip && \
  pip2 install neovim --user && \
  pip3 install neovim --user && \
  sudo apt-get install -y ruby ruby-dev && \
  sudo gem install neovim

# install
sudo add-apt-repository ppa:neovim-ppa/stable -y && \
  sudo apt-get update && \
  sudo apt-get install -y neovim exuberant-ctags

# plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins for neovim
nvim/init-docker.vim $home_user1/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# install plugins for neovim
curl -o ~/.config/nvim/init.vim -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/nvim/init-docker.vim && \
  nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# TERMINAL SETTINGS {{{1

# powerline font
cd && git clone --depth 1 https://github.com/powerline/fonts.git && \
  fonts/install.sh && \
  rm -rf fonts

# Devicon font
cd && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git && \
  cd nerd-fonts && ./install.sh DroidSansMono && cd .. && \
  rm -rf nerd-fonts

# # install plugins for nvim
#  mkdir -p ~/.config/nvim/ && \
#   curl -o ~/.config/nvim/init.vim -L \
#   https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/nvim/init-docker.vim && \
#   nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# # Dotfiles
# RUN git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git && \
#   cd dotfiles-ubuntu && chmod +x pull-docker.sh && ./pull-docker.sh && cd .. && \
#   rm -rf dotfiles-ubuntu

# # terminal colors
# git clone --depth 1 https://github.com/ErickChacon/Gogh.git
# Gogh/themes/gruvbox.dark.soft.sh
# rm -rf Gogh


# # italic and true color
# git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git
# tic dotfiles-ubuntu/xterm-256color-italic.terminfo
# rm -rf dotfiles-ubuntu

# # RSTAN {{{1
#
# # requeriments
# sudo apt-get install build-essential g++ clang-3.8 libssl-dev -y
#
# TERMINAL SOFTWARE {{{1

# unison
sudo apt-get install unison -y

# # silversearcher-ag
# sudo apt-get install silversearcher-ag -y

# # fzf
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install --all

# # ssh
# sudo apt-get install openssh-server -y

# MANAGMENT AND SYSTEM SOFTWARE {{{1

# # tweak-tool
# sudo apt-get install gnome-tweak-tool -y

# synaptic
sudo apt-get install synaptic -y

# psensor
sudo apt-get install psensor -y

# redshift
sudo apt-get install redshift-gtk -y

# # evolution
# sudo apt-get install evolution -y

# OFFICE SOFTWARE {{{1

# # latex
# sudo apt-get install texlive-full -y
# sudo apt-get install latexmk -y

# # titlesec package fix with version 2.10.2(2016-03-21)
# sudo wget http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.sty -O /usr/share/texlive/texmf-dist/tex/latex/titlesec/titlesec.sty

# inkscape
sudo apt install inkscape -y

# # additional latex tools
# sudo apt-get install dot2tex -y

# pdf viewer
sudo apt-get install okular -y

# SYNC SOFTWARE {{{1

# Mendeley
wget https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
sudo dpkg -i mendeleydesktop-latest
rm mendeleydesktop-latest

# dropbox
sudo apt-get install nautilus-dropbox -y

# Gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

# ENTERTAINMENT SOFTWARE {{{1

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys \
  931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | \
  sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y


# ADDITIONAL SOFTWARE {{{1

# # virtual box
# sudo apt-get install virtualbox -y

# # video snapshot requirements for animation
# sudo apt-get install blender openshot -y

# color picker
sudo apt-get install gpick -y


# # DOCUMENTATION SOFTWARE {{{1
# sudo apt-get install zeal -y

# DEVELOOPMENT SOFTWARE {{{1

# Setup docker repository
sudo apt-get update
sudo apt-get install apt-transport-https -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Install docker community edition
sudo apt-get update
sudo apt-get install docker-ce -y
# Add the current user to the docker group
sudo usermod -a -G docker $USER
# Verifying installation
docker run hello-world

# # DOTFILES {{{1
# git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git
# cd dotfiles-ubuntu && chmod +x pull.sh && ./pull.sh && cd ..
# rm -rf dotfiles-ubuntu

# WEB SOFTWARE {{{1

# chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# ATOM {{{1
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom -y
# }}}

