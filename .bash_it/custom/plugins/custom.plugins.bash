cite about-plugin
about-plugin 'my custom functions'

# list of my repositories
my_repos() {

  # define repositories
  local path_proj=~/Documents/Projects
  local path_proj_fi=$path_proj/FoodSecurity/5.Studies
  local path_repos=~/Documents/Repositories
  local path_latex=~/Documents/texmf/tex/latex
  local \
  repos=( \
  $path_proj_fi/MapFoodInse/7.Writing/paper-spmirt \
  $path_proj_fi/MapFoodInse-Cities/7.Writing/paper-mapfi \
  $path_repos/day2day \
  $path_repos/spifa \
  $path_repos/dotfiles-ubuntu-18 \
  $path_repos/Food-Security-Amazonia \
  $path_repos/git-commands \
  $path_repos/resume \
  $path_latex/research-notes \
  $path_latex/tex-commands \
    )

  # $path_proj/TrafficAccidents/AT2018 \

  # print nicely if yes or as an array otherwise
  local print=${1:-yes}
  if [[ $print = "yes" ]]; then
    for repo in ${repos[@]}; do
      echo $repo
    done
  else
    echo "${repos[@]}"
  fi
}

# make git pull on all the folders under the current directory
pull_repos() {
  for folder in */ ; do
    cd $folder
    echo $folder
    git pull
    cd ..
  done
}

# make git push on all the folders under the current directory
push_repos() {
  for folder in */ ; do
    cd $folder
    echo $folder
    git add -A
    git commit -m ${1:-automatic-push}
    git push
    cd ..
  done
}

# pull in all my repositories
pull_my_repos() {

  local current_dir=$(pwd)
  local repos=$(my_repos no)

  for repo in ${repos[@]}; do
    cd $repo
    echo $repo
    git pull
  done

  cd $current_dir

}


# push in all my repositories
push_my_repos() {

  local current_dir=$(pwd)
  local repos=$(my_repos no)

  for repo in ${repos[@]}; do
    cd $repo
    echo $repo
    git add -A
    git commit -m ${1:-automatic-push}
    git push
  done

  cd $current_dir

}

# colors
cols() {

  # remove lines when excedding the number of nvim processes
  local nr_nvim=$(pgrep -x nvim | wc -l)
  local nvim_active_file="/tmp/local/.nvim_active.vim"
  head $nvim_active_file -n $nr_nvim > temp.vim
  mv temp.vim $nvim_active_file

  # set up the terminal colors
  local profile=$(dconf read /org/gnome/terminal/legacy/profiles:/default)
  local full_profile=/org/gnome/terminal/legacy/profiles:/:${profile//\'/}
  IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat /tmp/local/.nvim_colors.vim))'
  dconf write $full_profile/background-color "'"${XYZ[0]}"'"
  dconf write $full_profile/foreground-color "'"${XYZ[1]}"'"
  dconf write $full_profile/palette "[ \
    '${XYZ[2]}', '${XYZ[3]}', '${XYZ[4]}', '${XYZ[5]}', '${XYZ[6]}', '${XYZ[7]}', \
    '${XYZ[8]}', '${XYZ[9]}', '${XYZ[10]}', '${XYZ[11]}', '${XYZ[12]}', '${XYZ[13]}', \
    '${XYZ[14]}', '${XYZ[15]}', '${XYZ[16]}', '${XYZ[17]}' \
    ]"
}

# fzf

# cf() {
#   cd $(ls | fzf)
# }

# update my shortcuts
shortcuts() {
  wget -O - \
    https://raw.githubusercontent.com/LukeSmithxyz/voidrice/master/.scripts/shortcuts.sh \
    | bash
}

# creeate i3 config file
i3_config() {

  colors="/tmp/local/.nvim_colors.vim"
  # colors_name="$HOME/Documents/.nvim_colors_name.vim"
  colors_name=(nvim_background nvim_foreground color_01 color_02 color_03 color_04 \
    color_05 color_06 color_07 color_08 color_09 color_10 color_11 color_12 color_13 \
    color_14 color_15 color_16)
  # colors_i3="$HOME/.config/i3/config-colors.sh"

  # printf "%s\n" "${colors_name[@]}" | paste - $colors | \
  #   awk '{print "set $" $1 " " $2}' > $colors_i3

  # cat $HOME/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh \
  #   $HOME/.config/i3/config-colors1.sh \
  #   $HOME/Documents/Repositories/dotfiles-ubuntu-18/i3/config-colors2.sh > \
  #   $HOME/.config/i3/config

# create i3 config file
printf "%s\n" "${colors_name[@]}" | paste - $colors | \
  awk '{print "set $" $1 " " $2}' | \
  cat $HOME/.config/i3/config-base.sh - \
  $HOME/.config/i3/config-colors.sh > \
  $HOME/.config/i3/config


    # $colors_i3 \
}

vpn() {
  # nm-applet
  # nmcli --ask con up id "Lancaster University VPN"
  nmcli --ask con up id "vpn"
}

