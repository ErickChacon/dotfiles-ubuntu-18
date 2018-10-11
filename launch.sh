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

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    HEIGHT=$height FONT0=$font0 FONT1=$font1 FONT2=$font2 \
      WLAN_INTERFACE=$wlan_interface \
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
