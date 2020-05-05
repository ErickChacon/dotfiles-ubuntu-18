#!/bin/sh

$HOME/.local/bin/monitors.sh
feh --bg-fill "$HOME/.config/wall.png"
/usr/bin/setxkbmap -option "ctrl:swapcaps"

mem(){
    mem=`free -h | awk '/Mem/ {printf $7}'`
    echo "RAM $mem"
}


while true; do
    xsetroot -name "$(mem) | $(date)"
    sleep 5
done

