#!/bin/sh

$HOME/.local/bin/monitors.sh
feh --bg-fill "$HOME/.config/wall.png"
/usr/bin/setxkbmap -option "ctrl:swapcaps"

while true; do
    xsetroot -name "$(date)"
    sleep 1
done

