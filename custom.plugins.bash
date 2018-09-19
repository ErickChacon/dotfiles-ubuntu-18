cite about-plugin
about-plugin 'my custom functions'

# list of my repositories
my_repos() {

  # define repositories
  local path_proj_fi=~/Documents/Projects/FoodSecurity/5.Studies
  local path_repos=~/Documents/Repositories
  local path_latex=~/Documents/texmf/tex/latex
  local \
  repos=( \
  $path_proj_fi/MapFoodInse/7.Writing/paper-spmirt \
  $path_proj_fi/MapFoodInse-Cities/7.Writing/paper-mapfi \
  $path_repos/day2day \
  $path_repos/dotfiles-ubuntu-18 \
  $path_repos/Food-Security-Amazonia \
  $path_repos/git-commands \
  $path_latex/research-notes \
  $path_latex/tex-commands \
    )

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

