#!/bin/sh

monitor=$(xrandr | awk '/ primary/ { print $1}')
echo $monitor
xrandr --output $monitor --brightness ${1:-0.2}
