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
  local current=$(pwd_short)
  local dot_dir="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18"
  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run -d --user rstudio --name ${1:-global-docker} \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -v /home/chaconmo/Documents/:/home/rstudio/Documents \
  -v /home/chaconmo/Dropbox/:/home/rstudio/Dropbox \
  -v /home/chaconmo/.ssh:/home/rstudio/.ssh \
  -v /home/chaconmo/.gitconfig:/home/rstudio/.gitconfig \
  -v /home/chaconmo/.tmux:/home/rstudio/.tmux \
  -v $dot_dir/docker/custom.aliases.bash:/home/rstudio/.bash_it/aliases/custom.aliases.bash \
  -v $dot_dir/docker/.tmux.conf:/home/rstudio/.tmux.conf \
  -v $dot_dir/R/Makevars:/home/rstudio/.R/Makevars \
  -w /home/rstudio$current \
  -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
  --rm -it my-r bash
}

stop-docker() {
docker stop ${1:-global-docker}
}

# execute bash on container
bs() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current ${1:-global-docker} bash
}

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
  docker exec -it -w /home/rstudio$current global-docker /home/rstudio/.tmux/proj-$1 $2
}


# execute R on container
R() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker R
}


# alias txl='tmux ls'
# alias txn='tmux new -s'
# alias txa='tmux a -t'
# alias txk='tmux kill-session -t'
# alias txo='.tmux/proj-$1'


# alias for directories
alias cdre='cd ~/Documents/Repositories'
alias cdno='cd ~/Documents/NotesCodes'
alias cdf='cd ~/Documents/Projects/FoodSecurity'
alias cdbw='cd ~/Documents/Projects/FoodSecurity/5.Studies/Birthweight'
alias cdcpp='cd ~/Documents/SelfLearning/Programming/cpp'
