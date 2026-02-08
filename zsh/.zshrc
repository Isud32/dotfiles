# Tobias's zsh conf
autoload -U colors && colors
autoload -Uz vcs_info

# Follow XDG Base Directory spec
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#default apps
export TERMINAL=alacritty
export EDITOR=nvim
export BROWSER=librewolf
export VISUAL=$EDITOR

# ZSH BUILT IN VIM MODE
set -o vi

# Command Prompt
# PS1="%B%{$fg[red]%}[%{%F{#7EA463}%}%n%{%F{#BAF286}%}@%{%F{#2596be}%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1='%B%{$fg[red]%}[%{%F{#7EA463}%}%n%{%F{#BAF286}%}@%{%F{#2596be}%}%M %{$fg[magenta]%}%~%{$fg[yellow]%}$(git_super_status)%{$fg[red]%}]%{$reset_color%}$%b '
# dwmblocks scripts
export PATH="$HOME/.local/src/blockscript:$PATH"
# my personal scripts that i dont keep on /usr/bin
export PATH="$HOME/.local/src/scripts:$PATH"
# direnv - python programming
eval "$(direnv hook zsh)"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
export PATH="/usr/bin/npm:$PATH"
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Colorize autocomplete suggestions
zstyle ':completion:*' list-colors 'yes'

zstyle ':completion:*' list-colors \
    "no=00" \
    "fi=00" \
    "di=34" \
    "ln=35" \
    "pi=33" \
    "so=32" \
    "bd=34;46" \
    "cd=34;43" \
    "or=31;01" \
    "mi=31;01"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
# Shell integrations
eval "$(fzf --zsh)"

#to use local libraries (did this for sdl2) 
export PATH="$HOME/.local/bin:$PATH"



# Created by `pipx` on 2024-11-30 02:24:22
export PATH="$PATH:/home/tobias/.local/bin"

# fix clutter home directory
export PATH=$PATH:/home/tobias/.spicetify
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
# Plugins ALLWAYS LAST
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-git-prompt/zshrc.sh
# Customize git prompt appearance
ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=" )"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}…"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}⚑"
