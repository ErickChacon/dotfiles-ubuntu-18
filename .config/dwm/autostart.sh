#!/bin/sh

# /usr/lib/gnome-settings-daemon/gsd-xsettings # gnome settings
# gnome-flashback

monitors=$(xrandr | awk '/ connected/ { print $1}')
monitors_len=$(echo $monitors | wc -w)

if [ $monitors_len -eq 2 ]; then
    xrandr \
        --output DP-1 --mode 3440x1440 --scale 1.5x1.5 --pos 0x0 --primary \
        --output eDP-1 --off
fi

feh --bg-fill "$HOME/.config/wall.png"
