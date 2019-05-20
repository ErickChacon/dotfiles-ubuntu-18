#!/bin/bash

ws1="bla"

# assign layouts
i3-msg 'workspace '$ws1'; append_layout ~/.config/i3/layouts/ws06.json'

# initialise programs
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ./.scripts/i3-ws02-work.sh'
sleep 1
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal'
sleep 1
i3-msg 'workspace '$ws1'; exec i3-sensible-terminal -e ranger'
sleep 1
i3-msg 'focus up; focus left'
