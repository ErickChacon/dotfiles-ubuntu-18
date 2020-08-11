
- Setup github
- git clone repo with submodules
    git clone --recurse-submodules https://github.com/ErickChacon/dotfiles-ubuntu-18.git

# Git

Detailed instructions can be found in https://github.com/ErickChacon/git-commands/blob/master/install.md

```
sudo apt-get install git
which git
```

# Neovim

Follow the general instructions from:
https://github.com/neovim/neovim/wiki/Installing-Neovim

Open Neovim from the terminal with `nvim` and check health status with `:CheckHealth`.
Neovim will give you suggestions to fix any problem. For example, for python, the
recomendation is `pip2 install neovim` and `pip3 install neovim`.

In the case of ruby you will need to install `ruby` and `ruby-dev`. Then install
Neovim rubygem with `gem install neovim`.

## Customize neovim

- Install vim-plug for easy management of plugins:
  - https://github.com/junegunn/vim-plug
- Copy nvim files from my repository:
  - https://github.com/ErickChacon/dotfiles-ubuntu
- For the powerline fonts, we need to install them:
  - https://github.com/vim-airline/vim-airline
  - https://github.com/powerline/fonts
  - After installing the font, open a terminal and choose your favorite powerline
    font. In my case I use `Ubuntu Mono derivative Poweline Regular`.
- Install nerd fonts for vim-devicons plugin:
  - https://github.com/ryanoasis/vim-devicons
  - https://github.com/ryanoasis/nerd-fonts#font-installation
```
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh DroidSansMono
```
In my case, I have to close all the terminal windows to see the changes in
vim-devicons.

# Terminal

- Customize colors in terminal
  - https://github.com/Mayccoll/Gogh
  - Gruvbox: `wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt`
  - Alternatively copy all my fork https://github.com/ErickChacon/Gogh and execute any
    theme that is inside the themes folder (i.e. gruvox.dark.soft.sh).
- Customize yout terminal theme with bash-it
  - Install bash-it https://github.com/Bash-it/bash-it
  - Add your custom aliases in `.bash_it/aliases/custom.aliases.bash`
    - https://github.com/ErickChacon/dotfiles-ubuntu/blob/master/custom.aliases.bash
  - Add your custom bashrc in `.bashrc`
    - https://github.com/ErickChacon/dotfiles-ubuntu/blob/master/.bashrc

# Manage several terminals with `tmux`:

- Install latest tmux https://github.com/tmux/tmux from the last release
  https://github.com/tmux/tmux/releases link.
  - Install dependencies: https://deductivelabs.com/en/2016/03/using-true-color-vim-tmux/
    - `sudo apt-get install libevent-dev libncurses-dev build-essential`
  - Download the release tarball, uncompress and intall:
    - `./configure && make`
    - `sudo make install`
- Tmux configuration for italics and true color
  - https://bruinsslot.jp/post/how-to-enable-true-color-for-neovim-tmux-and-gnome-terminal/
  - Copy the file xterm-256color-italic.terminfo found in https://github.com/ErickChacon/dotfiles-ubuntu
  - Install this terminfo:
    - `tic xterm-256color-italic.terminfo`
    - use this theme on the `.bashrc` file:
      - `export TERM=xterm-256color-italic`
    - set it on `.tmux.conf`
      - set -g default-terminal "xterm-256color-italic"

# Other system programs from ubuntu software

- redshift
- psensor
- typing: klavaro, tux typing
- synaptic
- dropbox
- evolution
- unison

# Spotify

- https://www.spotify.com/uk/download/linux/

# Mendeley

- https://www.mendeley.com/download-mendeley-desktop/ubuntu/instructions/

# Gitkraken

- https://www.gitkraken.com/

# R
- Ubuntu: https://cran.r-project.org/bin/linux/ubuntu/README.html
- Debian: https://cran.r-project.org/bin/linux/debian/
- Rstudio: https://www.rstudio.com/products/rstudio/

# Tex
- Texlive: https://www.tug.org/texlive/debian.html
- latexmk: http://mg.readthedocs.io/latexmk.html
- Additional:
  - `sudo apt-get install texlive-full`

# ssh
- set server with:
  - sudo apt-get install openssh-server
  - check the ip server: `ip addr show` or `ip a`
  - from the client: `ssh ip`
  - it works when the username is the same, but more generally: `ssh username@ip`
  - ssh key from the client: `ssh-copy-id -i ~/.ssh/id_rsa.pub ip`
  - on the server: `sudo nvim /etc/ssh/sshd_config`
  - `PasswordAuthentication no`
  - `sudo systemctl restart ssh`
- check proccesses running and kill them:
  - `ps aux` or `ps aux | grep top`
  - `kill #PIDnumber`
# nice customization
- numix theme and icons with unity-tweak-tool

# swap ctrl and caps lock
- install tweak-tool
- typing
- ctrl key position
- swap ctrl and caps lock

# Firefox
- It is installed by default.
- Firefox sync to share information across devices.
