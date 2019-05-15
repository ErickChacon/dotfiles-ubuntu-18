#!/usr/bin/env bash

# palettes name
path_pal="$HOME/.palette-name.vim"
path_pals="$HOME/.palettes"
path_nvim_colors="/tmp/local/.nvim_colors.vim"

palettes_name=(nord gruvbox material-theme deus one dracula neodark)

current_pal=$(cat $path_pal)
for pal_name in "${palettes_name[@]}"; do
  echo $pal_name > $path_pal
  nvim $path_nvim_init --headless +qall
  cp $path_nvim_colors "$path_pals/$pal_name.vim"
done
echo $current_pal > $path_pal

