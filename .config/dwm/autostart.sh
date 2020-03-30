#!/bin/sh

monitors=$(xrandr | awk '/ connected/ { print $1}')
monitors_len=$(echo $monitors | wc -w)
only_one=${1:-true}
internal=${2:-false}

if [ $monitors_len -eq 2 ]; then
    if [ $only_one = "true" ]; then
        if [ $internal = "true" ]; then
            xrandr \
                --output DP-1 --off \
                --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 0x0 --primary 
        else
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --primary \
                --output eDP-1 --off
        fi
    else
        if [ $internal = "true" ]; then
            xrandr \
                --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 0x0 --primary \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 3840x0
        else
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --primary \
                --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 5160x0
        fi
    fi
fi

feh --bg-fill "$HOME/.config/wall.png"
# /usr/bin/setxkbmap -option "ctrl:swapcaps"
