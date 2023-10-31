# Completion style:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'

# $CDPATH is overpowered (can allow us to jump to 100s of directories)
# so tends to dominate completion; exclude path-directories from the
# tag-order so that they will only be used as a fallback if no
# completions are found.
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# Enable keyboard navigation of completions in menu
# (not just tab/shift-tab but cursor keys as well):
zstyle ':completion:*' menu select

#
# Check prompt installation.
#
if (! [[ -d "$ZDOTDIR/plugins/pure" ]]) {
  return 1
}

# Add prompt to fpath
fpath=($fpath "$ZDOTDIR/plugins/pure")

# Prompt settings
typeset -g PURE_PROMPT_VICMD_SYMBOL="[N]"
typeset -g PURE_CMD_MAX_EXEC_TIME=1 # seconds

#
# Prompt styles
#
zstyle :prompt:pure:prompt:error color '#dc9656'
zstyle :prompt:pure:prompt:success color red
zstyle :prompt:pure:prompt:continuation color '#d3869b'
zstyle :prompt:pure:execution_time color cyan
zstyle :prompt:pure:suspended_jobs color yellow

# Git
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:git:fetch only_upstream yes
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:git:dirty color green
zstyle :prompt:pure:git:arrow color magenta

# This prompt pops when zsh think that your last command is misspelled
export SPROMPT="Correct %F{red}'%R'%f to %F{green}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

# Initialize the prompt system and pure theme.
promptinit; prompt pure
