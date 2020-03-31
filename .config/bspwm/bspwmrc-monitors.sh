#!/bin/sh

monitors=$(bspc query -M --names)
monitors_len=$(echo $monitors | wc -w)
ws1="  "; ws2="  "; ws3="  "; ws4="  "; ws5="  "
ws6="  "; ws7="  "; ws8="  "; ws9="  "; ws10="  "
only_one=${1:-false}
internal=${2:-true}

# if [ $monitors_len -eq 1 ]; then
#    bspc monitor $monitors -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9" "$ws10"
#    if [ $monitors_len -eq 2 ]; then
    sleep 1
    if [ $only_one = "true" ]; then
        if [ $internal = "true" ]; then
            xrandr --fb 2880x1620 \
                --output eDP-1 --mode 1920x1080 --scale 1.5x1.5 --primary \
                --panning 2880x1620+0+0 \
                --output DP-1 --off --verbose
            sleep 1
            bspc monitor eDP-1 -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9" "$ws10"
        else
            echo "try anothe option"
        fi
    else
     # xrandr \
     #   --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 \
     #   --output eDP-1 --mode 1920x1080 --scale 1.2x1.2 --pos 5160x0
     xrandr --fb 7464x2160 \
       --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 \
       --panning 5160x2160+0+0/5160x2160+0+0\
       --output eDP-1 --mode 1920x1080 --scale 1.2x1.2 --pos 5160x0 \
       --panning 2304x1296+5160+0/2304x1296+5160+0 --verbose
    sleep 1
    bspc monitor DP-1 -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9"
    bspc monitor eDP-1 -d "$ws10"
    fi
# elif [ $monitors_len -eq 3 ]; then
#     bspc monitor $(echo $monitors | awk '{print $1}') -d 1 2 3 4 5
#     bspc monitor $(echo $monitors | awk '{print $2}') -d 6 7 8
#    bspc monitor $(echo $monitors | awk '{print $3}') -d 9 10
# fi

# xdpyinfo | grep -B2 resolution

bash $HOME/.config/polybar/launch.sh           # polybar

feh --bg-fill "$HOME/.config/wall.png" # wallpaper
