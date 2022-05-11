# Finish if there isn't a plugins directory.
if (! [[ -d "$ZDOTDIR/plugins/" ]]) {
  return 1
}

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$ZDOTDIR/plugins/zsh-autopair/autopair.zsh"

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^n' autosuggest-accept

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
source "$ZDOTDIR/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
