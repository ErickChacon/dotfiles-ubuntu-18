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

cp docker/custom.aliases.bash .bash_it/aliases/
# install plugins for nvim
curl -o ~/.tmux.conf -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/nvim/init-docker.vim && \
  nvim --headless +PlugInstall +UpdateRemotePlugins +qall




# COPY docker/.bashrc .bash_profile .tmux.conf $home_user1/
# COPY --chown=rstudio .tmux $home_user1/.tmux/
# COPY nvim $home_user1/.config/nvim/



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

# tmux dotfiles
curl -OL https://github.com/ErickChacon/dotfiles-ubuntu/raw/master/xterm-256color-italic.terminfo && \
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo
cp custom.aliases.bash $home_user1/.bash_it/aliases/
COPY docker/.bashrc .bash_profile .tmux.conf $home_user1/

# install plugins for nvim
curl -o ~/.tmux.conf -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/nvim/init-docker.vim && \
  nvim --headless +PlugInstall +UpdateRemotePlugins +qall




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

# TERMINAL SETTINGS {{{1

# powerline font
cd && git clone --depth 1 https://github.com/powerline/fonts.git && \
  fonts/install.sh && \
  rm -rf fonts

# Devicon font
cd && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git && \
  cd nerd-fonts && ./install.sh DroidSansMono && cd .. && \
  rm -rf nerd-fonts

# # vim plugin manager
#  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins for nvim
 mkdir -p ~/.config/nvim/ && \
  curl -o ~/.config/nvim/init.vim -L \
  https://github.com/ErickChacon/dotfiles-ubuntu-18/raw/master/nvim/init-docker.vim && \
  nvim --headless +PlugInstall +UpdateRemotePlugins +qall

# Dotfiles
RUN git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git && \
  cd dotfiles-ubuntu && chmod +x pull-docker.sh && ./pull-docker.sh && cd .. && \
  rm -rf dotfiles-ubuntu

# # terminal colors
# git clone --depth 1 https://github.com/ErickChacon/Gogh.git
# Gogh/themes/gruvbox.dark.soft.sh
# rm -rf Gogh


# # italic and true color
# git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git
# tic dotfiles-ubuntu/xterm-256color-italic.terminfo
# rm -rf dotfiles-ubuntu

# R {{{1

# pandoc
sudo apt-get install -y pandoc pandoc-citeproc evince

# install
sudo apt-get install apt-transport-https && \
  echo -e "\n## Mirror for R software" | sudo tee -a /etc/apt/sources.list && \
  sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" && \
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x51716619e084dab9 && \
  sudo apt-get update && \
  sudo apt-get install -y littler r-cran-littler r-base r-base-dev r-recommended && \
  echo 'options(repos = c(CRAN = "https://cloud.r-project.org/"), download.file.method = "libcurl")' |\
    sudo tee /etc/R/Rprofile.site && \
  echo 'source("/etc/R/Rprofile.site")' | sudo tee -a /etc/littler.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r && \
  sudo ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r && \
  sudo install.r docopt

# openblas for multi-thread
sudo apt-get update && sudo apt-get install -y libopenblas-base libopenblas-dev

# devtools
echo "
userdir <- unlist(strsplit(Sys.getenv(\"R_LIBS_USER\"), .Platform\$path.sep))[1L]
dir.create(userdir, recursive = TRUE)
.libPaths(c(userdir, .libPaths()))
" > r-packages.R
R CMD BATCH r-packages.R
rm r-packages.R

# initial settings
echo "
local({
r <- getOption(\"repos\")
r[\"CRAN\"] <- \"http://cloud.r-project.org/\"
options(repos = r)
})" | sudo tee /etc/R/Rprofile.site

# # devtools
# echo "
# userdir <- unlist(strsplit(Sys.getenv(\"R_LIBS_USER\"), .Platform\$path.sep))[1L]
# dir.create(userdir, recursive = TRUE)
# .libPaths(c(userdir, .libPaths()))
# install.packages(\"devtools\")
# " > r-packages.R
# sudo apt-get install libcurl4-openssl-dev libssl-dev -y
# R CMD BATCH r-packages.R
# rm r-packages.R



# tidyverse and others
sudo apt-get update && \
  sudo apt-get -y install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libssl-dev \
  libcurl4-openssl-dev && \
  my-install2.r --error --deps TRUE --libloc ~/R/x86_64-pc-linux-gnu-library/3.5\
    tidyverse \
    dplyr \
    ggplot2 \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools && \
  install2.r --error --deps TRUE --libloc ~/R/x86_64-pc-linux-gnu-library/3.5\
    purrrlyr \
    data.table && \
  installGithub.r \
    tidyverse/ggplot2 \
    jalvesaq/colorout


# # colorout for R
# git clone --depth 1 https://github.com/jalvesaq/colorout.git
# R CMD INSTALL colorout
# rm -rf colorout

# rstudio
wget https://download1.rstudio.org/rstudio-xenial-1.0.153-amd64.deb
sudo apt-get install libjpeg62 -y
sudo dpkg -i rstudio-xenial-1.0.153-amd64.deb
rm rstudio-xenial-1.0.153-amd64.deb

# openblas for multi-thread
sudo apt-get install libopenblas-base libopenblas-dev -y

# RSTAN {{{1

# requeriments
sudo apt-get install build-essential g++ clang-3.8 libssl-dev -y

# TERMINAL SOFTWARE {{{1

# unison
sudo apt-get install unison -y

# silversearcher-ag
sudo apt-get install silversearcher-ag -y

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# ssh
sudo apt-get install openssh-server -y

# MANAGMENT AND SYSTEM SOFTWARE {{{1

# tweak-tool
sudo apt-get install gnome-tweak-tool -y

# synaptic
sudo apt-get install synaptic -y

# psensor
sudo apt-get install psensor -y

# redshift
sudo apt-get install redshift-gtk -y

# evolution
sudo apt-get install evolution -y

# OFFICE SOFTWARE {{{1

# latex
sudo apt-get install texlive-full -y
sudo apt-get install latexmk -y

# titlesec package fix with version 2.10.2(2016-03-21)
sudo wget http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.sty -O /usr/share/texlive/texmf-dist/tex/latex/titlesec/titlesec.sty

# inkscape
sudo apt install inkscape -y


# additional latex tools
sudo apt-get install dot2tex -y

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
  BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | \
  sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y


# ADDITIONAL SOFTWARE {{{1

# virtual box
sudo apt-get install virtualbox -y

# video snapshot requirements for animation
sudo apt-get install blender openshot -y

# color picker
sudo apt-get install gpick -y


# DOCUMENTATION SOFTWARE {{{1
sudo apt-get install zeal -y

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

# DOTFILES {{{1
git clone --depth 1 https://github.com/ErickChacon/dotfiles-ubuntu.git
cd dotfiles-ubuntu && chmod +x pull.sh && ./pull.sh && cd ..
rm -rf dotfiles-ubuntu

# WEB SOFTWARE {{{1

# chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# PYTHON 2 {{{1
pip install --upgrade pip
pip install ipython --user

# PYTHON 3 {{{1

pip3 install --upgrade pip
pip3 install ipython --user
pip3 install unidecode --user # for ultisnips

# data science packages
pip3 install numpy --user
pip3 install scipy --user
pip3 install sklearn --user
sudo apt-get install python3-matplotlib -y
pip3 install tensorflow --user

# images
pip3 install imageio --user

# compressed
pip3 install tarfile --user

# markdown
# pip3 install --upgrade Pweave --user


# notebooks
#  apt-get install build-essential -y # already installed
sudo apt-get install python3-dev -y
pip3 install jupyter --user

# gpflow
git clone --depth 1 https://github.com/GPflow/GPflow.git
pip3 install GPflow/ --user
rm -rf GPflow

# probabilistic programming
pip3 install edward --user

# python language server
pip3 install python-language-server --user
pip3 install python-language-server[all] --user
pip3 install jedi --user


# JULIA {{{1
# sudo ln -s ~/julia-d386e40c17/bin/julia /usr/local/bin/julia
# ATOM {{{1
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom -y
# }}}
# CPP {{{1

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository \
  "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main"
sudo apt-get update
sudo apt-get install clang-6.0 lldb-6.0 lld-6.0 clang-tools-6.0 -y
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 200
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 200
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 200


sudo apt-get install libgoogle-perftools4 libgoogle-perftools-dev -y
sudo apt-get install google-perftools -y

# Armadillo dependencies
sudo apt-get install cmake libopenblas-dev liblapack-dev libarpack2-dev -y

# Armadillo
wget http://sourceforge.net/projects/arma/files/armadillo-8.500.0.tar.xz
tar -xvf armadillo-8.500.0.tar.xz
cd armadillo-8.500.0/
cmake .
make
sudo make install

# }}}
# RUST {{{
curl https://sh.rustup.rs -sSf | sh
rustup update
rustup component add rls-preview rust-analysis rust-src
# }}}

