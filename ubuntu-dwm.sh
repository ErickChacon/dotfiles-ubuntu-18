sudo apt-get install -y xorg libx11-dev libxft-dev libxinerama-dev suckless-tools dmenu
# xdm
git clone https://git.suckless.org/dwm
# gdm3(defualt) xdm : /etc/init.d/
cd dwm
sudo make clean install
