#!/bin/sh

# this work only for one monitor
monitor=$(xrandr | awk '/ connected /{print $1}')
# use primary when connected to 2 monitors
echo $monitor
xrandr --output $monitor --brightness ${1:-0.2}

