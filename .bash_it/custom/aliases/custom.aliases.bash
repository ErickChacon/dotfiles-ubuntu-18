cite 'about-alias'
about-alias 'custom aliases and functions to work with docker'

# pwd without home
pwd_short() {
  local current=$(pwd)
  if [[ $current == $HOME ]]; then
    current=""
  else
    current=${current/"$HOME"/}
  fi
  echo $current
}

# create docker container
start-docker() {
  mkdir -p /tmp/local
  local current=$(pwd_short)
  local repo_dir="/home/chaconmo/Documents/Repositories"
  local dot_dir="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18"
  local dot_dir_g="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18/stat-toolbox-dotfiles"
  local dot_docker="$dot_dir/stat-toolbox"

  echo $dot_docker

  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run -d --user rstudio --name ${1:-global-docker} \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -v $HOME/Documents/:/home/rstudio/Documents \
  -v $HOME/Dropbox/:/home/rstudio/Dropbox \
  -v $HOME/Documents/texmf:/home/rstudio/.TinyTeX/texmf-home \
  -v $HOME/.ssh:/home/rstudio/.ssh \
  -v $HOME/.gitconfig:/home/rstudio/.gitconfig \
  -v $HOME/.shortcuts:/home/rstudio/.shortcuts \
  -v $HOME/.palette-name.vim:/home/rstudio/.palette-name.vim \
  -v $HOME/.palettes:/home/rstudio/.palettes \
  -v $HOME/.config/mutt:/home/rstudio/.config/mutt \
  -v /tmp/local:/tmp/local \
  -v $dot_dir/.bash_it/custom:/home/rstudio/.bash_it/custom
    # custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \
  -v $dot_docker/.bashrc:/home/rstudio/.bashrc \
  -v $dot_docker/.bash_profile:/home/rstudio/.bash_profile \
  -v $dot_dir_g/.scripts:/home/rstudio/.scripts \
  -v $dot_docker/nvim:/home/rstudio/.config/nvim \
  -v $dot_dir_g/.tmux:/home/rstudio/.tmux \
  -v $dot_docker/.tmux.conf:/home/rstudio/.tmux.conf \
  -v $dot_docker/.Rprofile:/home/rstudio/.Rprofile \
  -v $dot_docker/.ctags:/home/rstudio/.ctags \
  -v $dot_docker/R/Makevars:/home/rstudio/.R/Makevars \
  -w /home/rstudio$current \
  -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
  --rm -it ${3:-erickchacon/stat-toolbox:3.6.2} bash
}

  # -v $dot_dir/custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \
  # -v $dot_docker/custom.aliases.bash:/home/rstudio/.bash_it/aliases/custom.aliases.bash \

start-docker-rstudio() {
  mkdir -p /tmp/local
  local current=$(pwd_short)
  local repo_dir="/home/chaconmo/Documents/Repositories"
  local dot_dir="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18"
  local dot_dir_g="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18/stat-toolbox-dotfiles"

  if [ -z "$2" ]; then
    local dot_docker="$dot_dir/stat-toolbox/3.6.0"
    echo default
  elif [ $2 == "latest" ]; then
    local dot_docker="$dot_dir/stat-toolbox"
    echo latest
  elif [ -d "$dot_dir/stat-toolbox/$2" ]; then
    local dot_docker="$dot_dir/stat-toolbox/$2"
    echo version
  else
    local dot_docker="$dot_dir/stat-toolbox/3.6.0"
    echo non-existed version
  fi

  echo $dot_docker

  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run --name ${1:-global-docker} \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -v $HOME/Documents/:/home/rstudio/Documents \
  -v $HOME/Dropbox/:/home/rstudio/Dropbox \
  -v $HOME/Documents/texmf:/home/rstudio/.TinyTeX/texmf-home \
  -v $HOME/.ssh:/home/rstudio/.ssh \
  -v $HOME/.gitconfig:/home/rstudio/.gitconfig \
  -v $HOME/.shortcuts:/home/rstudio/.shortcuts \
  -v $HOME/.palette-name.vim:/home/rstudio/.palette-name.vim \
  -v $HOME/.palettes:/home/rstudio/.palettes \
  -v $HOME/.config/mutt:/home/rstudio/.config/mutt \
  -v /tmp/local:/tmp/local \
  -v $dot_dir/custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \
  -v $dot_docker/custom.aliases.bash:/home/rstudio/.bash_it/aliases/custom.aliases.bash \
  -v $dot_docker/.bashrc:/home/rstudio/.bashrc \
  -v $dot_docker/.bash_profile:/home/rstudio/.bash_profile \
  -v $dot_dir_g/.scripts:/home/rstudio/.scripts \
  -v $dot_docker/nvim:/home/rstudio/.config/nvim \
  -v $dot_dir_g/.tmux:/home/rstudio/.tmux \
  -v $dot_docker/.tmux.conf:/home/rstudio/.tmux.conf \
  -v $dot_docker/.Rprofile:/home/rstudio/.Rprofile \
  -v $dot_docker/.ctags:/home/rstudio/.ctags \
  -v $dot_docker/R/Makevars:/home/rstudio/.R/Makevars \
  -w /home/rstudio$current \
  -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
  -p 8787:8787 -e PASSWORD=reproducible \
  --rm ${3:-erickchacon/stat-toolbox:3.6.0}
}



  # -v /home/chaconmo/texmf:/home/rstudio/.TinyTex/texmf-home \
  # -v $repo_dir/reserch-notes:/usr/local/lib/R/share/texmf

stop-docker() {
docker stop ${1:-global-docker}
}

# execute bash on container
bs() {
  local current=$(pwd_short)
  if [[ $# > 1 ]]; then
    docker exec -it --user $2 -w /home/rstudio$current ${1:-global-docker} bash
  else
    docker exec -it -w /home/rstudio$current ${1:-global-docker} bash
  fi
}
# --user ${2:-rstudio}

# execute nvim on container
vm() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker nvim $1
}

# execute tmux on container
tx() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker tmux
}

# open tmux projects on container
txo() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current ${3:-global-docker} /home/rstudio/.tmux/proj-$1 $2
}


# execute R on container
R2() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker R
}

newcol() {
  bash $HOME/.scripts/colors-i3-config.sh ${1:-true}
  i3-msg reload
  i3-msg restart
}



# alias txl='tmux ls'
# alias txn='tmux new -s'
# alias txa='tmux a -t'
# alias txk='tmux kill-session -t'
# alias txo='.tmux/proj-$1'

# alias
alias col='i3_config && cols && i3-msg reload && i3-msg restart'
# alias col='i3_config && cols && i3-msg reload && i3-msg restart'

# # alias for directories
# alias cdre='cd ~/Documents/Repositories'
# alias cdno='cd ~/Documents/NotesCodes'
# alias cdf='cd ~/Documents/Projects/FoodSecurity'
# alias cdbw='cd ~/Documents/Projects/FoodSecurity/5.Studies/Birthweight'
# alias cdcpp='cd ~/Documents/SelfLearning/Programming/cpp'
#
