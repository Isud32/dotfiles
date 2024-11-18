# Tobias's zsh conf
autoload -U colors && colors
# Command Prompt
PS1="%B%{$fg[red]%}[%{%F{#7EA463}%}%n%{%F{#BAF286}%}@%{%F{#2596be}%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PATH="$HOME/.local/src/blockscript:$PATH"
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

# Case sensitive disable doesn't work :/ TODO
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

# Shell integrations
eval "$(fzf --zsh)"

# Plugins ALLWAYS LAST
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
