#!/usr/bin/env bash

# select a random palette
path_pals="$HOME/.palettes"
path_palname="$HOME/.palette-name.vim"
pal=$(cat $path_palname)
path_colors=$path_pals/$pal

# # # colors name
# colors_name=(nvim_background nvim_foreground color_01 color_02 color_03 color_04 \
#   color_05 color_06 color_07 color_08 color_09 color_10 color_11 color_12 color_13 \
#   color_14 color_15 color_16)

# # create i3 config file
# printf "%s\n" "${colors_name[@]}" | paste - $path_colors | \
#   awk '{print "set $" $1 " " $2}' | \
#   cat $HOME/Documents/Repositories/dotfiles-ubuntu-18/i3/config-base.sh \
#   - \
#   $HOME/Documents/Repositories/dotfiles-ubuntu-18/i3/config-colors2.sh > \
#   $HOME/.config/i3/config

# set up the terminal colors
profile=$(dconf read /org/gnome/terminal/legacy/profiles:/default)
full_profile=/org/gnome/terminal/legacy/profiles:/:${profile//\'/}
IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat $path_colors))'
dconf write $full_profile/background-color "'"${XYZ[0]}"'"
dconf write $full_profile/foreground-color "'"${XYZ[1]}"'"
dconf write $full_profile/bold-color "'"${XYZ[11]}"'"
dconf write $full_profile/palette "[ \
  '${XYZ[2]}', '${XYZ[3]}', '${XYZ[4]}', '${XYZ[5]}', '${XYZ[6]}', '${XYZ[7]}', \
  '${XYZ[8]}', '${XYZ[9]}', '${XYZ[10]}', '${XYZ[11]}', '${XYZ[12]}', '${XYZ[13]}', \
  '${XYZ[14]}', '${XYZ[15]}', '${XYZ[16]}', '${XYZ[17]}' \
  ]"
# dconf write $full_profile/palette "[ \
#   '${XYZ[2]}', '${XYZ[8]}', '${XYZ[4]}', '${XYZ[3]}', '${XYZ[2]}', '${XYZ[12]}', \
#   '${XYZ[4]}', '${XYZ[9]}', '${XYZ[10]}', '${XYZ[11]}', '${XYZ[12]}', '${XYZ[13]}', \
#   '${XYZ[14]}', '${XYZ[15]}', '${XYZ[16]}', '${XYZ[17]}' \
#   ]"

# dconf write $full_profile/palette "[ \
#   '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', \
#   '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', \
#   '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}', '${XYZ[1]}' \
#   ]"

# 1 unknown
# 2 string, bar for error message, zip file ranger
# 3 keywords, chaconmo-Precicion-5510
# 4 unknown: ranger jpg
# 5 comments
# 6 parenthesis, objects, some keywords
# 7 functions in R, object in vim, terminal path
# 8 unknown
# 9 unknown
# 10 git symbol
# 11 chaconmo, function, executable files, chaconmo ranger
# 12 unknown
# 13 unknown: directories and ~/ ranger
# 14 unknown
# 15 unknown
# 16 fontground message

# echo "is it working" >> $HOME/.config/i3/configplop
# bla
