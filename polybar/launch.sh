#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')


if [[ $HOSTNAME == "chaconmo-ThinkPad-L470-W10DG" ]]; then
  echo "Working at Lancaster University!"
  height=27
  fontsize=10
  wlan_interface=wlp6s0
elif [[ $HOSTNAME == "chaconmo-Precision-5510" ]]; then
  height=47
  fontsize=20
  wlan_interface=wlp2s0
fi

font0="FontAwesome:size=${fontsize:-20};0"
font1="DroidSansMono Nerd Font:size=${fontsize:-20};0"
font2="siji:pixelsize=${fontsize:-20};1"

# select a random palette
path_pals="$HOME/.palettes"
path_palname="$HOME/.palette-name.vim"
pal=$(cat $path_palname)
path_colors=$path_pals/$pal

# path_colors="/tmp/local/.nvim_colors.vim"
IFS=$'\r\n' GLOBIGNORE='*' command eval  'colors=($(cat $path_colors))'
nvim_background=${colors[0]}
nvim_foreground=${colors[1]}
color_01=${colors[2]}
color_02=${colors[3]}
color_03=${colors[4]}
color_04=${colors[5]}
color_05=${colors[6]}
color_06=${colors[7]}
color_07=${colors[8]}
color_08=${colors[9]}
color_09=${colors[10]}
color_10=${colors[11]}
color_11=${colors[12]}
color_12=${colors[13]}
color_13=${colors[14]}
color_14=${colors[15]}
color_15=${colors[16]}
color_16=${colors[17]}

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    HEIGHT=$height FONT0=$font0 FONT1=$font1 FONT2=$font2 \
      WLAN_INTERFACE=$wlan_interface \
      NVIM_BACKGROUND=$nvim_background NVIM_FOREGROUND=$nvim_foreground \
      COLOR_01=$color_01 COLOR_02=$color_02 COLOR_03=$color_03 COLOR_04=$color_04 \
      COLOR_05=$color_05 COLOR_06=$color_06 COLOR_07=$color_07 COLOR_08=$color_08 \
      COLOR_09=$color_09 COLOR_10=$color_10 COLOR_11=$color_11 COLOR_12=$color_12 \
      COLOR_13=$color_13 COLOR_14=$color_14 COLOR_15=$color_15 COLOR_16=$color_16 \
      MONITOR=$m polybar --reload example &
    # MONITOR=$m polybar --reload top &
    # MONITOR=$m polybar --reload bottom &
    # MONITOR=$m polybar --reload topbar &
    # MONITOR=$m polybar --reload bottombar &
  done
else
  polybar --reload example &
fi

# # Launch bar1 and bar2
# polybar bar1 &
# polybar bar2 &

# polybar example

# echo "Bars launched..."
