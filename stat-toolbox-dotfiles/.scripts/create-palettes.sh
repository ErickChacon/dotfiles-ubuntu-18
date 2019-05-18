#!/usr/bin/env bash

# palettes name
path_pal="$HOME/.palette-name.vim"
path_pals="$HOME/.palettes"
path_nvim_colors="/tmp/local/.nvim_colors.vim"
path_nvim_init="$HOME/.config/nvim/init-pals.vim"
palettes_name=(gruvbox monokai spacegray NeoSolarized OceanicNext neodark nord \
  crunchbang material-theme dracula janah alduin jellybeans one \
  space-vim-dark tender deus base16-default-dark)

# clean old palettes
rm $path_pals/*

# create new palettes
current_pal=$(cat $path_pal)
for pal_name in "${palettes_name[@]}"; do
  echo $pal_name > $path_pal
  echo creating $pal_name palette
  nvim -u $path_nvim_init --headless +qall
  cp $path_nvim_colors "$path_pals/$pal_name.vim"
done
echo $current_pal > $path_pal

