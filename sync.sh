#!/bin/sh

REPO="$HOME/Docs/dotfiles"

cp ~/.xinitrc "$REPO/"

rsync -a ~/.config/alacritty/ "$REPO/dotconfig/alacritty/"
rsync -a ~/.config/tmux/      "$REPO/dotconfig/tmux/"
rsync -a ~/.config/picom/     "$REPO/dotconfig/picom/"
rsync -a ~/.config/rofi/     "$REPO/dotconfig/rofi/"

rsync -a ~/.config/zsh/ "$REPO/zsh/"

rsync -a ~/.local/src/dwm/        "$REPO/dwm/"
rsync -a ~/.local/src/dwmblocks/  "$REPO/dwmblocks/"
rsync -a ~/.local/src/blockscript/ "$REPO/blockscript/"
rsync -a ~/.local/src/scripts/ "$REPO/scripts-src/"

