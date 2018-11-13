# Download base image goespatial {{{1

FROM rocker/geospatial

# Software for installation {{{1

RUN apt-get install -y git curl wget

# CPP tools {{{1

# lvm-toolchain for c++ language server protocol
RUN echo "\ndeb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
  tee -a /etc/apt/sources.list && \
  echo "deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-6.0 main" | \
  tee -a /etc/apt/sources.list && \
  apt-get install -y gnupg && \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -y clang-6.0 lldb-6.0 lld-6.0 clang-tools-6.0 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 200 && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 200 && \
  update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 200

# armadillo c++ library
ARG arma_version=armadillo-9.100.5
RUN apt-get install -y cmake libopenblas-dev liblapack-dev libarpack2-dev && \
  wget http://sourceforge.net/projects/arma/files/${arma_version}.tar.xz && \
  tar -xvf ${arma_version}.tar.xz && \
  cd ${arma_version} && \
  cmake . && \
  make && \
  make install && \
  cd .. && \
  rm -rf ${arma_version}.tar.xz ${arma_version}

# Latex packages {{{1

RUN tlmgr update --self && \
  tlmgr install fancyhdr titlesec pgf xcolor tcolorbox environ trimspaces float \
  doublestroke algorithms algorithmicx appendix multirow ctable tablefootnote xifthen \
  ifmtarg anyfontsize todonotes enumitem bbm bbm-macros babel-portuges type1cm ec \
  collection-fontsrecommended && \
  tlmgr update --self -all && \
  tlmgr path add && \
  fmtutil-sys -all

# Complementary software for R {{{1

RUN sudo apt-get install -y \
  # openblas for multi-thread
  libopenblas-base libopenblas-dev \
  # rstan requirements
  build-essential g++ libssl-dev

# Additional R packages {{{1

RUN \
  # gui tools
  installGithub.r jalvesaq/colorout && \
  install2.r --error --deps TRUE languageserver && \
  # tidyverse related
  install2.r --error --deps TRUE purrrlyr && \
  # cpp and benchmark
  install2.r --error --deps TRUE RcppArmadillo rbenchmark && \
  # visualization
  installGithub.r ggobi/ggally clauswilke/ggridges && \
  install2.r --error --deps TRUE ggrepel ggmap corrplot && \
  # spatial related
  install2.r --error --deps TRUE pdist fields && \
  # modelling
  install2.r --error --deps TRUE lme4 gamlss R2BayesX coda MBA spam spBayes && \
  install2.r --error --deps TRUE --repos http://R-Forge.R-project.org bamlss && \
  # applied regression
  install2.r --error --deps TRUE car \
  # categorical data
  vcd \
  # applied regression
  psych && \
  # my repositories
  installGithub.r ErickChacon/day2day

# sudo apt-get install -y r-cran-rjava
# echo "install.packages(\"OpenStreetMap\")" > r-packages.R
# R CMD BATCH r-packages.R

# rclient for redis
# echo "install.packages(\"rredis\")" > r-packages.R


# # web and markdown
# echo "install.packages(\"blogdown\")" > r-packages.R
# echo "blogdown::install_hugo()" >> r-packages.R
# echo "install.packages(\"formatR\")" >> r-packages.R
# R CMD BATCH r-packages.R

# Tmux {{{1

RUN apt-get install -y \
  # dependencies
  libevent-dev libncurses-dev build-essential && \
  # install
  curl -sL https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz | \
  tar xz && \
  cd tmux-2.7 && \
  ./configure && make && \
  make install && \
  cd .. && \
  rm -rf tmux-2.7 && \
# italic and true color
  curl -OL \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/docker/xterm-256color-italic.terminfo && \
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo

# Neovim {{{1

RUN \
  # backport mirror for neovim > 2.0.0
  echo "deb http://ftp.debian.org/debian stretch-backports main" | \
  tee -a /etc/apt/sources.list && \
  # requirements
  apt-get update && \
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags && \
  # install
  apt-get -t stretch-backports -y install "neovim"

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
RUN mkdir $home_user1/.config
COPY nvim/plugins.vim $home_user1/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# initiallize nvim-r for .cache folder
RUN mkdir .cache && \
  nvim plop.R --headless '+call StartR("R")' +qall

# Dotfiles {{{1

COPY --chown=rstudio custom.aliases.bash $home_user1/.bash_it/aliases/
COPY --chown=rstudio .bashrc .bash_profile .tmux.conf $home_user1/
COPY --chown=rstudio .Rprofile /home/$user1/
COPY --chown=rstudio nvim $home_user1/.config/nvim/
COPY --chown=rstudio R/Makevars $home_user1/.R/

# Change to root for permissions {{{1

USER root

# Terminal software {{{1

RUN apt-get install -y silversearcher-ag
# RUN apt-get install -y ranger

# latex {{{1
RUN tlmgr update --self && \
  # for double space
  tlmgr install setspace && \
  # for moderncv
  tlmgr install moderncv colortbl microtype fontawesome && \
  tlmgr update --self -all && \
  tlmgr path add && \
  fmtutil-sys -all


RUN tlmgr update --self && \
  tlmgr install setspace moderncv colortbl microtype fontawesome && \
  tlmgr update --self -all && \
  tlmgr path add && \
  fmtutil-sys -all


# r {{{1

RUN \
  # networks
  install2.r --error --deps TRUE shp2graph && \
  # distributions
  installGithub.r olmjo/RcppTN


