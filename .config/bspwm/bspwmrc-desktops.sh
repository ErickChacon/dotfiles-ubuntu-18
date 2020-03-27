#!/bin/sh

# Initialize docker containers

$HOME/.local/bin/start-docker.sh dot
$HOME/.local/bin/start-docker.sh
sleep 1

# Desktop 1

bspc desktop -f "^1"

bspc node -i
bspc node @/ -p east -o 0.5 -i

bspc rule -a Gnome-terminal -o node=@/2 && gnome-terminal -- ~/.local/bin/recep1.sh
bspc rule -a Gnome-terminal -o node=@/1 && gnome-terminal -- ~/.local/bin/recep2.sh
sleep 1

# Desktop 2

bspc desktop -f "^2"
gnome-terminal
sleep 1

# Desktop 3

bspc desktop -f "^3"
gnome-terminal
sleep 1

# Desktop 5

bspc desktop -f "^5"
# bspc desktop -l monocle
gnome-terminal -- ranger
sleep 1

# Desktop 6

bspc desktop -f "^6"
firefox &
sleep 3

# Desktop 9

# bspc desktop -f "^9"
# bspc desktop -l monocle
# gnome-terminal -- neomutt
# sleep 1

# Desktop 10

bspc desktop -f "^10"
bspc desktop -l monocle
spotify &
sleep 1

# Desktop focus

bspc desktop -f "^3"



# bspc desktop -f "^7" --layout tiled
# bspc desktop --focus "^9"
# bspc desktop --layout monocle
#  
# bspc desktop --focus "^10"
# bspc desktop --layout monocle


# sleep 1
# gnome-terminal
# bspc node -f @brother && bspc node --ratio 0.5 && bspc node -f next.local
# bspc node -f @/2 && bspc node --ratio 0.5 && bspc node -f next.local
# bspc node -f @parent && bspc node --ratio 0.5 && bspc node -f next.local
#bspc node -f @/ && bspc node --ratio 0.5 && bspc node -f next.local

#bspc node -z left -40 0
# bspc node @/1 -B
# bspc node @/2/2 -i
# bspc rule -a Firefox -o node=@/2/2 && firefox

# bspc node -i
# bspc node @/ -p east -i
# bspc node @/2 -p north -i


# bspc node @/ -p east -i
# bspc node @/2 -p north -i
# #bspc rule -a Firefox -o node=@/1 && firefox
# #bspc rule -a Gnome-terminal -o node=@/1 && gnome-terminal
# bspc rule -a Gnome-terminal -o node=@/2/1 && gnome-terminal -- ~/recep1.sh
# 
# #bspc rule -a Chromium desktop='^2'
# 
# # bspc rule -a Gnome-terminal -o node=@/2/2 && gnome-terminal -- i3-tx.sh
# bspc rule -a Gnome-terminal -o node=@/2/2
# # gnome-terminal -- nvim
# gnome-terminal -- ~/recep2.sh
# # gnome-terminal -- bash
#  #~/recep1.sh
# # -- ls 
# # docker exec -it -w /home/rstudio global-docker
# 
# #            /home/rstudio/.tmux/proj-$1 $2
# #tx
# 
# sleep 1;
# 
# #gnome-terminal -x bash -c "<my command or script>; exec bash"
# 
# bspc node @/1 -f
# 
# # bspc rule -a Test:test -o node=@/1
# # bspc rule -a Test:test -o node=@/2/1
# # bspc rule -a Test:test -o node=@/2/2
# 
# # bspc query -N -n '.leaf.!window.local'
# # bspc node 0x01600052 -k
# # for i in $(bspc query -N -n '.leaf.!window.local'); do bspc node $i -k; done
