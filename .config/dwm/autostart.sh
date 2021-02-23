#!/bin/sh

$HOME/.local/bin/monitors.sh
feh --bg-fill "$HOME/.config/wall.png"
/usr/bin/setxkbmap -option "ctrl:swapcaps"
killall -q sxhkd; sxhkd &

killall -q dwmblocks; dwmblocks &

# ~/Documents/Installers/xp-pen/Linux_Pentablet_V1.2.13.1/Pentablet_Driver.sh &

# mem(){
#     mem=`free -h | awk '/Mem/ {printf $7}'`
#     echo "RAM $mem"
# }


# while true; do
#     # xsetroot -name "$(mem) | $(date)"
#     xsetroot -name "$(cpu_old.sh)"
#     sleep 1
# done

