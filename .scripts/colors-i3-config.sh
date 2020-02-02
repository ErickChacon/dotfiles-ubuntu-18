#!/usr/bin/env bash

# paths for palettes and current palette-name
path_pals="$HOME/.palettes"
path_palname="$HOME/.palette-name.vim"
random=${1:-true}

# select palette (random or current) and write selected palette name
if [[ $random == true ]]; then
  pals=($(ls $path_pals))
  n_pals=${#pals[@]}
  rand=$[$RANDOM % n_pals]
  pal=${pals[rand]}
  echo $pal > $path_palname
else
  pal=$(cat $path_palname)
fi

# colors name
colors_name=(color_bg color_fg color_01 color_02 color_03 color_04 \
  color_05 color_06 color_07 color_08 color_09 color_10 color_11 color_12 color_13 \
  color_14 color_15 color_16)

# create i3 config file
printf "%s\n" "${colors_name[@]}" | paste - $path_pals/$pal | \
  awk '{print "set $" $1 " " $2}' | \
  cat $HOME/.config/i3/config-base.sh - > $HOME/.config/i3/config

# print selected palette
echo Selected palette: $pal
