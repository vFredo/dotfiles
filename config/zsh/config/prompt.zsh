# Check prompt installation.
if (! [[ -d "$ZDOTDIR/plugins/pure" ]]) {
  return 1
}

# Add prompt to fpath.
fpath=($fpath "$ZDOTDIR/plugins/pure")

# Prompt settings.
typeset -g PURE_PROMPT_VICMD_SYMBOL="❮"
zstyle :prompt:pure:git:stash show yes

# Initialize the prompt system.
promptinit

# Prompt theme.
prompt pure

# Prompt styles.
zstyle :prompt:pure:prompt:error color yellow
zstyle :prompt:pure:prompt:success color red

# This prompt pops when zsh think that your last command is misspelled
export SPROMPT="Correct %F{red}'%R'%f to %F{orange}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "
