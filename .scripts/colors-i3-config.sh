#!/usr/bin/env bash

# select a random palette and write selected palette name
path_pals="$HOME/.palettes"
pals=($(ls $path_pals))
n_pals=${#pals[@]}
rand=$[$RANDOM % n_pals]
pal=${pals[rand]}
path_colors=$path_pals/$pal
path_pal="$HOME/.palette-name.vim"
echo $pal > $path_pal
echo $pal

# colors name
colors_name=(color_bg color_fg color_01 color_02 color_03 color_04 \
  color_05 color_06 color_07 color_08 color_09 color_10 color_11 color_12 color_13 \
  color_14 color_15 color_16)

# create i3 config file
printf "%s\n" "${colors_name[@]}" | paste - $path_colors | \
  awk '{print "set $" $1 " " $2}' | \
  cat $HOME/.config/i3/config-base.sh - \
  $HOME/.config/i3/config-colors.sh > \
  $HOME/.config/i3/config
