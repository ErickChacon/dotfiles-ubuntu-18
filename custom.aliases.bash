
# cite 'about-alias'
# about-alias 'Tmux terminal multiplexer'

# alias tx='docker exec -ti global-docker tmux'
alias txl='tmux ls'
alias txn='tmux new -s'
alias txa='tmux a -t'
alias txk='tmux kill-session -t'
# alias txo='.tmux/proj-$1'

txo() {
  # echo '.tmux/proj-'$1
  ./.tmux/proj-$1 $2
}

vm() {
  current=$(pwd)
  current=${current/"$HOME/"/}
  docker exec -it -w /home/rstudio/$current global-docker nvim $1
}

tx() {
  current=$(pwd)
  current=${current/"$HOME/"/}
  docker exec -it -w /home/rstudio/$current global-docker tmux $1
}

R() {
  current=$(pwd)
  current=${current/"$HOME/"/}
  docker exec -it -w /home/rstudio/$current global-docker R
}


my-docker() {
  current=$(pwd)
  current=${current/"$HOME/"/}
  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run --user rstudio --name ${1:global-docker} \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -v /home/chaconmo/Documents/:/home/rstudio/Documents \
  -v /home/chaconmo/.ssh:/home/rstudio/.ssh \
  -v /home/chaconmo/.gitconfig:/home/rstudio/.gitconfig \
  -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
  --rm -it my-r bash
}

  # docker run --user rstudio --name ${1:global-docker} \
  # -v /home/chaconmo/Documents/:/home/rstudio/Documents \
  # -v /home/chaconmo/.ssh:/home/rstudio/.ssh \
  # -v /home/chaconmo/.gitconfig:/home/rstudio/.gitconfig \
  # --rm -it -e "TERM=xterm-256color-italic" my-r bash

# alias vm="docker exec -ti global-docker nvim"
# alias R="docker exec -ti global-docker R"

alias cdre='cd ~/Documents/Repositories'
alias cdno='cd ~/Documents/NotesCodes'
alias cdf='cd ~/Documents/Projects/FoodSecurity'
alias cdbw='cd ~/Documents/Projects/FoodSecurity/5.Studies/Birthweight'
alias cdcpp='cd ~/Documents/SelfLearning/Programming/cpp'
