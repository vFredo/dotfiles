# Check prompt installation.
if (! [[ -d "$ZDOTDIR/plugins/pure" ]]) {
  return 1
}

# Add prompt to fpath
fpath=($fpath "$ZDOTDIR/plugins/pure")

# Prompt settings
typeset -g PURE_PROMPT_VICMD_SYMBOL="❮"

# Prompt styles
zstyle :prompt:pure:prompt:error color '#dc9656'
zstyle :prompt:pure:prompt:success color red
zstyle :prompt:pure:prompt:continuation color '#d3869b'
zstyle :prompt:pure:execution_time color cyan
zstyle :prompt:pure:suspended_jobs color yellow

# Git
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:fetch only_upstream yes
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:git:arrow color magenta
zstyle :prompt:pure:git:dirty color '#d3869b'

# This prompt pops when zsh think that your last command is misspelled
export SPROMPT="Correct %F{red}'%R'%f to %F{green}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

# Initialize the prompt system and pure theme.
promptinit; prompt pure
