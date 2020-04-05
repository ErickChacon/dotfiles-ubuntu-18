#!/bin/sh

$HOME/.local/bin/start-docker.sh dot
$HOME/.local/bin/start-docker.sh

# gnome-terminal
firefox &
gnome-terminal -- ranger
spotify &

