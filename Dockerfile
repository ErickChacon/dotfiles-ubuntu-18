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
RUN apt-get -t stretch-backports -y install "neovim"

# Add my user {{{1

ARG user1=rstudio
ENV home_user1=/home/$user1
USER $user1
WORKDIR $home_user1

# Software for terminal settings {{{1

# bash-it
RUN git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
  ~/.bash_it/install.sh --silent

# vim plugin manager
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins for neovim
COPY nvim/init-docker.vim $home_user1/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# initiallize nvim-r for .cache folder
RUN mkdir .cache && \
  nvim plop.R --headless '+call StartR("R")' +qall

# Dotfiles {{{1

COPY custom.aliases.bash $home_user1/.bash_it/aliases/
COPY docker/.bashrc .bash_profile .tmux.conf $home_user1/
COPY --chown=rstudio .tmux $home_user1/.tmux/
COPY nvim $home_user1/.config/nvim/

# Change to root for permissions {{{1

USER root

# Additional latex packages {{{1

# RUN tlmgr update --self && \
#   tlmgr install fancyhdr titlesec pgf xcolor tcolorbox environ trimspaces float \
#   doublestroke algorithms algorithmicx appendix multirow ctable tablefootnote xifthen \
#   ifmtarg && \
#   tlmgr update --self -all && \
#   tlmgr path add && \
#   fmtutil-sys -all


# Complementary software for R {{{1

# openblas for multi-thread
RUN sudo apt-get install -y libopenblas-base libopenblas-dev && \
  # rstan requirements
  apt-get install -y build-essential g++ libssl-dev

# Additional R packages {{{1

RUN installGithub.r jalvesaq/colorout && \
  install2.r --error --deps TRUE languageserver \
  RcppArmadillo

# dotfiles for R
COPY .Rprofile /home/$user1/

# CPP tools {{{1

# backport mirror for neovim > 2.0.0
RUN echo "\ndeb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
  tee -a /etc/apt/sources.list && \
  echo "deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
  tee -a /etc/apt/sources.list && \
  apt-get install -y gnupg && \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -y clang-6.0 lldb-6.0 lld-6.0 clang-tools-6.0

RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 200 && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 200 && \
  update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 200

# Armadillo dependencies
RUN apt-get install -y cmake libopenblas-dev liblapack-dev libarpack2-dev

# Armadillo
RUN wget http://sourceforge.net/projects/arma/files/armadillo-8.500.0.tar.xz && \
  tar -xvf armadillo-8.500.0.tar.xz && \
  cd armadillo-8.500.0/ && \
  cmake . && \
  make && \
  make install

RUN install2.r --error --deps TRUE purrrlyr ggrepel && \
  installGithub.r jalvesaq/colorout && \
  # visualization
  installGithub.r ggobi/ggally clauswilke/ggridges && \
  install2.r --error --deps TRUE ggmap && \
  # model
  install2.r --error --deps TRUE lme4 gamlss R2BayesX coda MBA spam && \
  install2.r --error --deps TRUE --repos http://R-Forge.R-project.org bamlss
  # spatial
  # install2.r --error --deps TRUE fields


# sudo apt-get install -y r-cran-rjava
# echo "install.packages(\"OpenStreetMap\")" > r-packages.R
# R CMD BATCH r-packages.R

# # spatial related packages
# echo "install.packages(\"pdist\")" > r-packages.R
# R CMD BATCH r-packages.R

# echo "install.packages(\"rbenchmark\")" >> r-packages.R

# echo "install.packages(\"rredis\")" > r-packages.R


# # web and markdown
# echo "install.packages(\"blogdown\")" > r-packages.R
# echo "blogdown::install_hugo()" >> r-packages.R
# echo "install.packages(\"formatR\")" >> r-packages.R
# R CMD BATCH r-packages.R



