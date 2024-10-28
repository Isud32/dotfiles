# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Default Progrmas
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="fiefox"

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep dwm || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi


