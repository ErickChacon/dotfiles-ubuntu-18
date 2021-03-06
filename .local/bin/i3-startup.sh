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
i3-msg 'workspace '$ws2'; append_layout ~/.config/i3/layouts/ws03.json'
i3-msg 'workspace '$ws3'; append_layout ~/.config/i3/layouts/ws03.json'
i3-msg 'workspace '$ws4'; append_layout ~/.config/i3/layouts/ws04.json'
i3-msg 'workspace '$ws5'; append_layout ~/.config/i3/layouts/ws05.json'
# i3-msg 'workspace '$ws9'; append_layout ~/.config/i3/layouts/ws05.json'
i3-msg 'workspace '$ws9'; append_layout ~/.config/i3/layouts/ws-social.json'

# initialise ws1
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ./.local/bin/i3-ws01-org.sh'
sleep 1
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ./.local/bin/i3-ws01-re.sh'
sleep 1

# initialise ws2
i3-msg 'workspace '$ws2'; exec i3-sensible-terminal -e ./.local/bin/i3-txo-proj1.sh'
sleep 1
i3-msg 'workspace '$ws2'; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace '$ws2'; exec cd ~/Documents/Repositories && i3-sensible-terminal -e ranger'
sleep 1
i3-msg 'workspace '$ws2'; focus up; focus left'
sleep 1

# initialise ws3
# i3-msg 'workspace '$ws3'; exec i3-sensible-terminal'
i3-msg 'workspace '$ws2'; exec i3-sensible-terminal -e ./.local/bin/i3-txo-proj2.sh'
sleep 1
i3-msg 'workspace '$ws3'; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace '$ws3'; exec cd ~/Documents/Repositories && i3-sensible-terminal -e ranger'
sleep 3
i3-msg 'workspace '$ws3'; focus up; focus left'
sleep 1

# initialise ws4
i3-msg 'workspace '$ws4'; exec i3-sensible-terminal -e ranger'
sleep 1

# initialise ws9
# i3-msg 'workspace '$ws9'; exec firefox -url https://outlook.office.com/ https://mail.google.com/'
i3-msg 'workspace '$ws9'; exec i3-sensible-terminal -e neomutt'
sleep 1
# i3-msg 'workspace '$ws9'; exec i3-sensible-terminal -e neomutt'
# sleep 1
i3-msg 'workspace '$ws9'; exec firefox --new-window'
sleep 1


# initialise ws9
# i3-msg 'workspace '$ws9'; exec firefox -url https://outlook.office.com/ https://mail.google.com/'
# sleep 1

# initialise ws5
i3-msg 'workspace '$ws5'; exec firefox --new-window'
sleep 1


# initialise ws10
sleep 1
i3-msg 'workspace '$ws10'; exec spotify'


