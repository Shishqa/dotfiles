[ -f "$ZDOTDIR/.zshrc" ] && source "$ZDOTDIR/.zshrc"

exec startx

#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#	exec startx 
#else 
#    echo 'cannot exec startx'
#fi
