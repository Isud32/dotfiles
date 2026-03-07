#!/bin/sh

mkdir -p ~/.config
mkdir -p ~/.local/src

rsync -a --delete .xinitrc ~/

rsync -a  dotconfig/alacritty/ ~/.config/alacritty/
rsync -a  dotconfig/tmux/      ~/.config/tmux/
rsync -a  dotconfig/picom/     ~/.config/picom/

rsync -a zsh/ ~/.config/zsh/

sudo mkdir -p /usr/share/zsh/plugins
sudo rsync -a zsh-plugins/ /usr/share/zsh/plugins/

rsync -a dwm        ~/.local/src/
rsync -a dwmblocks  ~/.local/src/
rsync -a blockscript ~/.local/src/
rsync -a scripts ~/.local/src/

sudo rsync -a scripts-usr-local-bin/ /usr/local/bin/
