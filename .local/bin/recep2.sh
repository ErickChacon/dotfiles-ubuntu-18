#!/bin/sh

# pwd without home
pwd_short() {
    current=$(pwd)
    if [ $current = $HOME ]; then
        current=""
    else
        current=${current/"$HOME"/}
    fi
    echo $current
}

txo() {
    current=$(pwd_short)
    docker exec -it -w /home/rstudio$current ${3:-dot} \
        /home/rstudio/.tmux/proj-$1 $2
}


current=$(pwd_short)
# docker exec -it -w /home/rstudio$current global-docker tmux
txo org

