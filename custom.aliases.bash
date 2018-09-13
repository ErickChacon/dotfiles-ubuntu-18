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
  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run -d --user rstudio --name ${1:-global-docker} \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -v /home/chaconmo/Documents/:/home/rstudio/Documents \
  -v /home/chaconmo/Dropbox/:/home/rstudio/Dropbox \
  -v /home/chaconmo/.ssh:/home/rstudio/.ssh \
  -v /home/chaconmo/.gitconfig:/home/rstudio/.gitconfig \
  -v /home/chaconmo/.bash_it:/home/rstudio/.bash-it \
  -v /home/chaconmo/.tmux:/home/rstudio/.tmux \
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
  docker exec -it -w /home/rstudio$current global-docker bash
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

# execute R on container
R() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker R
}

txo() {
  # echo '.tmux/proj-'$1
  ./.tmux/proj-$1 $2
}

  # docker run --user rstudio --name ${1:global-docker} \
  # -v /home/chaconmo/Documents/:/home/rstudio/Documents \
  # -v /home/chaconmo/.ssh:/home/rstudio/.ssh \
  # -v /home/chaconmo/.gitconfig:/home/rstudio/.gitconfig \
  # --rm -it -e "TERM=xterm-256color-italic" my-r bash

# alias vm="docker exec -ti global-docker nvim"
# alias R="docker exec -ti global-docker R"

# alias tx='docker exec -ti global-docker tmux'
alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'
alias txk='tmux kill-session -t'
# alias txo='.tmux/proj-$1'


alias cdre='cd ~/Documents/Repositories'
alias cdno='cd ~/Documents/NotesCodes'
alias cdf='cd ~/Documents/Projects/FoodSecurity'
alias cdbw='cd ~/Documents/Projects/FoodSecurity/5.Studies/Birthweight'
alias cdcpp='cd ~/Documents/SelfLearning/Programming/cpp'
