
# pwd without home
function pwd_short() {
    local current=$(pwd)
    if [ $current = $HOME ]; then
        current=""
    else
        current=${current/"$HOME"/}
    fi
    echo $current
}

# docker functions
if [ -x "$(command -v docker)" ]; then
    function start-docker() {
        mkdir -p /tmp/local
        local current=$(pwd_short)
        local repo_dir="/home/chaconmo/Documents/Repositories"
        local dot_dir="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18"
        local dot_dir_g="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18/stat-toolbox-dotfiles"
        local dot_docker="$dot_dir/stat-toolbox"
        local cont_name=${1:-global-docker}
        arg_port=""
        if [ $cont_name = "global-docker" ]; then arg_port="-p 8787:8787"; fi
        echo $dot_docker
        XSOCK=/tmp/.X11-unix && \
        XAUTH=/tmp/.docker.xauth && \
        xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
        docker run -d --user rstudio --name $cont_name \
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
        -v $HOME/.remoteR/R_library/nvimcom:/usr/local/lib/R/site-library/nvimcom \
        -v $HOME/.remoteR/NvimR_cache:/home/rstudio/.cache/Nvim-R \
        -v /tmp/Nvim-R-chaconmo:/tmp/Nvim-R-chaconmo \
        -v $dot_docker/.bash_profile:/home/rstudio/.bash_profile \
        -v $dot_docker/.bashrc:/home/rstudio/.bashrc \
        -v $dot_dir/.bash_it/custom:/home/rstudio/.bash_it/custom \
        -v $HOME/.local/bin:/home/rstudio/.local/bin \
        -v $dot_dir_g/.scripts:/home/rstudio/.scripts \
        -v $dot_docker/nvim:/home/rstudio/.config/nvim \
        -v $dot_dir_g/.tmux:/home/rstudio/.tmux \
        -v $dot_docker/.tmux.conf:/home/rstudio/.tmux.conf \
        -v $dot_docker/.Rprofile:/home/rstudio/.Rprofile \
        -v $dot_docker/.ctags:/home/rstudio/.ctags \
        -v $dot_docker/R/Makevars:/home/rstudio/.R/Makevars \
        -v $dot_docker/.lintr:/home/rstudio/.lintr \
        -w /home/rstudio$current \
        -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
        -e NVIMR_COMPLDIR=~/.cache/Nvim-R  -e NVIMR_TMPDIR=~/.cache/Nvim-R/tmp \
        -e "TERM=xterm-256color-italic" \
        $arg_port \
        --rm -it ${3:-erickchacon/stat-toolbox:3.6.2} /home/rstudio/bash-enable.sh
    }

        # -v $HOME/.cache/Nvim-R:/home/rstudio/.remoteR/NvimR_cache \
        # -v $HOME/blassdf:/usr/local/lib/R/site-library \

        # --rm -it ${3:-erickchacon/stat-toolbox:3.6.2} touch bla.R

        # -v $dot_docker/.profile:/home/rstudio/.profile \

        # -p 8787:8787 \
        # -v $HOME/.shortcuts:/home/rstudio/.shortcuts \
        # -v $HOME/.palette-name.vim:/home/rstudio/.palette-name.vim \
        # -v $HOME/.palettes:/home/rstudio/.palettes \

      # -v $dot_dir/.bash_it/custom/docker.plugins.bash:/dev/null \
      # -v $dot_dir/custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \
      # -v $dot_docker/custom.aliases.bash:/home/rstudio/.bash_it/aliases/custom.aliases.bash \
        # custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \

        # -v /tmp/Nvim-R:/tmp/Nvim-R \

    function start-docker-rstudio() {
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
        -v $dot_docker/.lintr:/home/rstudio/.lintr \
        -w /home/rstudio$current \
        -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
        -p 8787:8787 -e PASSWORD=reproducible \
        --rm ${3:-erickchacon/stat-toolbox:3.6.2}
    }

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

    # docker-compose rm
    dcomp-rm(){
    docker-compose --file \
        ${2:-~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml} \
        rm --f ${1:-}
    }

    # docker-compose down
    dcomp-down(){
    docker-compose --file \
        ${1:-~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml} \
        down
    }

    # docker-compose build
    dcomp-build(){
    docker-compose --file \
        ${2:-~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml} \
        build --build-arg UID=$(id -u) --build-arg GID=$(id -g) ${1:-r}
    }

    # docker-compose run
    dcomp-run(){
    mkdir -p /tmp/local && \
    XAUTH=/tmp/.docker.xauth && \
        xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
        docker-compose --file \
        ${3:-~/Documents/Repositories/dotfiles-ubuntu-18/toolbox/docker-compose.yml} \
        run --name toolbox_${1:-r} --rm --service-ports ${2:---detach} ${1:-r} bash
    }

    # docker-compose exec
    dcomp-exec(){
    local current=$(pwd_short)
    local what=${1:-r}
    if [ $what = "r" ]; then
        user=rstudio
    elif [ $what = "julia" ]; then
        user=julia
    elif [ $what = "juliat" ]; then
        user=julia
    else
        user=rstudio
    fi
    docker exec -ti -w /home/$user$current toolbox_$what bash
    }

fi

# nvim shortcut
if ! [ -x "$(command -v docker)" ]; then
    alias vm="nvim"
else
    vm() {
        local current=$(pwd_short)
        docker exec -it -w /home/rstudio$current global-docker nvim $1
    }
fi


# tx shortcut
if ! [ -x "$(command -v docker)" ]; then
    alias tx='tmux'
else
    tx() {
        local current=$(pwd_short)
        docker exec -it -w /home/rstudio$current global-docker tmux
    }
fi

# open tmux projects on container
if ! [ -x "$(command -v docker)" ]; then
    txo() {
        ~/.tmux/proj-$1 $2
    }
else
    txoo() {
        local current=$(pwd_short)
        docker exec -it -w /home/rstudio$current ${3:-global-docker} \
            /home/rstudio/.tmux/proj-$1 $2
    }
    txo() {
        ~/.config/tmux/proj-$1 $2
    }
fi


# execute R on container
R2() {
  local current=$(pwd_short)
  docker exec -it -w /home/rstudio$current global-docker R
}

newcol() {
  bash $HOME/.local/bin/colors-i3-config.sh ${1:-true}
  i3-msg reload
  i3-msg restart
}

# alias
alias col='i3_config && cols && i3-msg reload && i3-msg restart'
# alias col='i3_config && cols && i3-msg reload && i3-msg restart'
