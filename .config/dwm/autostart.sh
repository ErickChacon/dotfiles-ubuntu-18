#!/bin/sh

monitors=$(xrandr | awk '/ connected/ { print $1}')
monitors_len=$(echo $monitors | wc -w)
only_one=${1:-true}
internal=${2:-false}

if [ $(hostname) = "fyb044000004" ]; then
# if [ $monitors_len -eq 2 ]; then
if [ 2 -gt 1 ]; then
    if [ $only_one = "true" ]; then
        if [ $internal = "true" ]; then
            xrandr --fb 2496x1404 \
                --output DP-1 --off \
                --output eDP-1 --mode 1920x1080 --scale 1.3x1.3 --pos 0x0 --panning 2496x1404 --primary 
        else
            xrandr --fb 5160x2160 \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --panning 5160x2160 --primary \
                --output eDP-1 --off
        fi
    else
        if [ $internal = "true" ]; then
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1x1 --pos 1920x0 \
                --output eDP-1 --mode 1920x1080 --scale 1x1 --pos 0x0 --primary
        else
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1x1 --pos 0x0 \
                --output eDP-1 --mode 1920x1080 --scale 1x1 --pos 3440x0 --primary
        fi
    fi
fi
else
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
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 3840x0 \
                --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 0x0 --primary
        else
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --primary \
                --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 5160x0
        fi
    fi
fi
fi

feh --bg-fill "$HOME/.config/wall.png"
# /usr/bin/setxkbmap -option "ctrl:swapcaps"
