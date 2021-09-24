#==========================================================================#

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/oh-my-zsh"

# Custom place of zsh-custom folder
ZSH_CUSTOM="$ZDOTDIR/custom"

#==========================================================================#

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="shishqa"

#==========================================================================#

# How often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Make git load faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom history location
HISTFILE="$ZDOTDIR/.zsh-history"
HISTSIZE=500
SAVEHIST=100

# Time stamps in history file
HIST_STAMPS="dd/mm/yyyy"

#==========================================================================#

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    timer
)

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"
TIMER_FORMAT="\n\e[95m[%d]\e[39m"

#==========================================================================#

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"
[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

#==========================================================================#

[ -f "$ZDOTDIR/.aliasrc" ] && source "$ZDOTDIR/.aliasrc"

[ -f "$SCRIPTS/shittime.bash" ] && source "$SCRIPTS/shittime.bash"

#==========================================================================#

# Clippy
#[ -f "$HOME/dev/__mipt/tftds/distsys-course/client/activate" ] && source "$HOME/dev/__mipt/tftds/distsys-course/client/activate"
#[ -f "$HOME/dev/__mipt/tftds/distsys-course/client/complete.bash" ] && source "$HOME/dev/__mipt/tftds/distsys-course/client/complete.bash"
