# #!/bin/bash
#
# source ~/.bashrc
#
# mkdir -p /tmp/local
# local current=$(pwd_short)
# local repo_dir="/home/chaconmo/Documents/Repositories"
# local dot_dir="/home/chaconmo/Documents/Repositories/dotfiles-ubuntu-18"
# XSOCK=/tmp/.X11-unix && \
# XAUTH=/tmp/.docker.xauth && \
# xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
# docker run -d --user rstudio --name ${1:-global-docker} \
# -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
# -v $HOME/Documents/:/home/rstudio/Documents \
# -v $HOME/Dropbox/:/home/rstudio/Dropbox \
# -v $HOME/Documents/texmf:/home/rstudio/.TinyTeX/texmf-home \
# -v $HOME/.ssh:/home/rstudio/.ssh \
# -v $HOME/.gitconfig:/home/rstudio/.gitconfig \
# -v $HOME/.shortcuts:/home/rstudio/.shortcuts \
# -v /tmp/local:/tmp/local \
# -v $dot_dir/custom.plugins.bash:/home/rstudio/.bash_it/plugins/custom.plugins.bash \
# -v $dot_dir/docker/custom.aliases.bash:/home/rstudio/.bash_it/aliases/custom.aliases.bash \
# -v $dot_dir/docker/.bashrc:/home/rstudio/.bashrc \
# -v $dot_dir/docker/.bash_profile:/home/rstudio/.bash_profile \
# -v $dot_dir/docker/.tmux:/home/rstudio/.tmux \
# -v $dot_dir/docker/.tmux.conf:/home/rstudio/.tmux.conf \
# -v $dot_dir/docker/.Rprofile:/home/rstudio/.Rprofile \
# -v $dot_dir/docker/.ctags:/home/rstudio/.ctags \
# -v $dot_dir/docker/nvim:/home/rstudio/.config/nvim \
# -v $dot_dir/docker/R/Makevars:/home/rstudio/.R/Makevars \
# -w /home/rstudio$current \
# -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
# --rm -it erickchacon/stat-toolbox bash
#
