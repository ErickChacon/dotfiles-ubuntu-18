#!/bin/bash

# workspaces names
ws1="1  | "
ws2="2  | "
ws3="3  | "
ws4="4  |  "
ws5="5  | "
ws6="6 "
ws7="7  | "
ws8="8  | "
ws9="9  | "
ws10="10  | "

# assign layouts
i3-msg 'workspace '$ws1'; append_layout ~/.config/i3/layouts/ws01.json'
i3-msg 'workspace '$ws2'; append_layout ~/.config/i3/layouts/ws02.json'
i3-msg 'workspace '$ws3'; append_layout ~/.config/i3/layouts/ws03.json'
i3-msg 'workspace '$ws4'; append_layout ~/.config/i3/layouts/ws03.json'
i3-msg 'workspace '$ws5'; append_layout ~/.config/i3/layouts/ws05.json'
i3-msg 'workspace '$ws9'; append_layout ~/.config/i3/layouts/ws05.json'

# initialise programs
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ./.scripts/i3-ws01-org.sh'
sleep 1
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ./.scripts/i3-ws01-re.sh'
sleep 1
i3-msg 'workspace '$ws2'; exec i3-sensible-terminal -e ./.scripts/i3-ws02-work.sh'
sleep 1
i3-msg 'workspace '$ws2'; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace '$ws2'; exec cd ~/Documents/Repositories && i3-sensible-terminal -e ranger'
sleep 1
i3-msg 'focus up; focus left'
sleep 1
i3-msg 'workspace '$ws3'; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace '$ws4'; exec i3-sensible-terminal -e ranger'
sleep 1
i3-msg 'workspace '$ws5'; exec firefox --new-window'
sleep 1
i3-msg 'workspace '$ws9'; exec firefox --new-window'
sleep 1
i3-msg 'workspace '$ws10'; exec spotify'

