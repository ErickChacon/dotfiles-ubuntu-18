#!/bin/sh
# Read palette name (~/.palette-name.vim) and associated colors (~/.palettes) to
# create the color configuration of the windows managers

# paths for palettes and current palette-name
path_pals="$HOME/.palettes"
pal=$(cat $HOME/.palette-name.vim)

# color names
col_names="color_bg\ncolor_fg\ncolor_01\ncolor_02\ncolor_03\ncolor_04\ncolor_05\n"
col_names=$col_names"color_06\ncolor_07\ncolor_08\ncolor_09\ncolor_10\ncolor_11\n"
col_names=$col_names"color_12\ncolor_13\ncolor_14\ncolor_15\ncolor_16"

# create i3 config file
echo $col_names | paste - $path_pals/$pal | awk '{print "set $" $1 " " $2}' | \
  cat $HOME/.config/i3/config-base.sh - > $HOME/.config/i3/config

# create bspwm config colors file
