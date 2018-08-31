# TERMINAL SETTINGS {{{1

# bash-it
git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh -n

# powerline font
git clone --depth 1 https://github.com/powerline/fonts.git
fonts/install.sh
rm -rf fonts

# Devicon font
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts && ./install.sh DroidSansMono && cd ..
rm -rf nerd-fonts

# terminal colors
git clone --depth 1 https://github.com/ErickChacon/Gogh.git
Gogh/themes/gruvbox.dark.soft.sh
rm -rf Gogh
