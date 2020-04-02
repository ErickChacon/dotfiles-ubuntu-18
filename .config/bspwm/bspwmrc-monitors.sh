#!/bin/sh

monitors=$(xrandr | awk '/ connected/ { print $1}')
monitors_len=$(echo $monitors | wc -w)
ws1="  "; ws2="  "; ws3="  "; ws4="  "; ws5="  "
ws6="  "; ws7="  "; ws8="  "; ws9="  "; ws10="  "
only_one=${1:-true}
internal=${2:-false}

if [ $monitors_len -eq 2 ]; then
    if [ $only_one = "true" ]; then
        if [ $internal = "true" ]; then
            xrandr --fb 2496x1404 \
                --output DP-1 --off \
                --output eDP-1 --mode 1920x1080 --scale 1.3x1.3 --pos 0x0 \
                --panning 2496x1404+0+0 --primary 
            bspc monitor eDP-1 -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9" "$ws10"
        else
            xrandr --fb 5160x2160 \
                --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --panning 5160x2160 --primary \
                --output eDP-1 --off
            bspc monitor DP-1 -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9" "$ws10"
        fi
    else
        if [ $internal = "true" ]; then
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1x1 --pos 1920x0 \
                --output eDP-1 --mode 1920x1080 --scale 1x1 --pos 0x0 --primary
        else
            xrandr \
                --output DP-1 --mode 3440x1440 --scale 1x1 --pos 0x0 \
                --output eDP-1 --mode 1920x1080 --scale 1x1 --pos 5160x0 --primary
        fi
    bspc monitor DP-1 -d "$ws1" "$ws2" "$ws3" "$ws4" "$ws5" "$ws6" "$ws7" "$ws8" "$ws9"
    bspc monitor eDP-1 -d "$ws10"
    fi
fi

feh --bg-fill "$HOME/.config/wall.png" # wallpaper
bash $HOME/.config/polybar/launch.sh           # polybar
