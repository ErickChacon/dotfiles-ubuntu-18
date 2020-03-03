#!/usr/bin/env bash

# select a random palette
path_pals="$HOME/.palettes"
path_palname="$HOME/.palette-name.vim"
pal=$(cat $path_palname)
path_colors=$path_pals/$pal

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

# 1 mutt bg unred messages
# 2 string, bar for error message, zip file ranger, read email color
# 3 keywords, chaconmo-Precicion-5510, ranger tab bg
# 4 unknown: ranger jpg
# 5 comments
# 6 parenthesis, objects, some keywords
# 7 functions in R, object in vim, terminal path
# 8 unknown
# 9 unknown
# 10 git symbol, unread email sender
# 11 chaconmo, function, executable files, chaconmo ranger
# 12 unknown
# 13 unknown: directories and ~/ ranger
# 14 unknown
# 15 unknown
# 16 fontground message
