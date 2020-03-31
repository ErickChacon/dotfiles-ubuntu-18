#!/bin/sh



bspc config border_width         4
bspc config window_gap          12

bspc config focused_border_color "#D23D3D"
bspc config normal_border_color "#000000"

bspc config split_ratio          0.5
bspc config borderless_monocle   true
bspc config gapless_monocle      false

bspc config focus_follows_pointer true

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
# bspc rule -a Firefox desktop='^6'
bspc rule -a spotify desktop='^10'

# xrandr --dpi 220

bspc config remove_disabled_monitors true
bspc config remove_unplugged_monitors true

