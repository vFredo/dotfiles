# Vi-mode
bindkey -v

# Alllow ctrl-w to delete a word as vim insert mode
bindkey '^w' backward-kill-word

# Allow v to edit the command line on vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Make Ctrl-z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0  ]]; then
    fg
  else
    zle push-input
  fi
}

zle -N fg-bg
bindkey '^Z' fg-bg
