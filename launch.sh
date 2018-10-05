#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
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
