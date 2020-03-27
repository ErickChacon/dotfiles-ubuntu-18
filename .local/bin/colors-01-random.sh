#!/bin/sh
# Picks randomly a pallete name from ~/.palettes directory and save the name on
# ~/.palette-name.vim

# paths for palettes and current palette-name
path_pals="$HOME/.palettes"
path_palname="$HOME/.palette-name.vim"

# select random palette and write selected palette name
pals=$(ls $path_pals)
n_pals=$(echo $pals | wc -w)
rand=$(shuf -i 1-$n_pals -n 1)
pal=$(echo $pals | cut -d " " -f $rand)
echo $pal > $path_palname
echo Selected palette: $pal
