# some globals
setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt AUTO_PUSHD              # [default] cd automatically pushes old dir onto dir stack
setopt AUTO_RESUME             # allow simple commands to resume backgrounded jobs
setopt CORRECT                 # [default] command auto-correction
setopt PRINT_EXIT_VALUE        # [default] for non-zero exit status

setopt COMPLETE_ALIASES # Prevent aliases from being substituted before completion is attempted.
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion.
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns.
setopt MENU_COMPLETE # Instead of listing possibilities, select the first match immediately.

# History
typeset -g HISTFILE="$HOME/.local/share/zsh/zshhistory" # Where history logs are stored.
typeset -g HISTSIZE=10000000 # The maximum number of events stored in the internal history list.
typeset -g SAVEHIST=$HISTSIZE # The maximum number of history events to save in the history file.
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY # Save each command's epoch timestamps and the duration in seconds.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS # Don't display a line previously found.
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter non-contiguous duplicates from history
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording an entry.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt HIST_VERIFY # Don't execute the line directly instead perform history expansion.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.

# Prompting
setopt PROMPT_SUBST # Expansions are performed in prompts.

# autostart a new tmux session if it is not already running
if [[ ! $TERM_PROGRAM =~ tmux ]]; then
  if command -v tmux >/dev/null; then
    if ! tmux has-session -t 0 2>/dev/null; then
      tmux new-session -s 0
    fi
  fi
fi

function -auto-ls-after-cd() {
    emulate -L zsh
    # Only in response to a user-initiated `cd`, not indirectly (eg. via another function).
    if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
      ls --almost-all --classify --color=always --group-directories-first --literal
    fi
}
add-zsh-hook chpwd -auto-ls-after-cd

