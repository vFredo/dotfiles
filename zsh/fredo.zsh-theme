#
# Global
#

# Create a hash table for globally stashing variables without polluting main
# scope with a bunch of identifiers.
typeset -A __FREDO

__FREDO[ITALIC_ON]=$'\e[3m'
__FREDO[ITALIC_OFF]=$'\e[23m'

#
# Completion
#

autoload -U compinit
compinit -u

# Make completion:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'

# $CDPATH is overpowered (can allow us to jump to 100s of directories) so tends
# to dominate completion; exclude path-directories from the tag-order so that
# they will only be used as a fallback if no completions are found.
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'

# Enable keyboard navigation of completions in menu
# (not just tab/shift-tab but cursor keys as well):
zstyle ':completion:*' menu select

#
# Prompt
#

autoload -U colors
colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked git-st
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:hg*:*' formats '[%m%b] '
zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
zstyle ':vcs_info:hg*:*' branchformat '%b'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:*' get-mq false
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-message:*' hooks hg-message

function +vi-hg-bookmarks() {
    emulate -L zsh
    if [[ -n "${hook_com[hg-active-bookmark]}" ]]; then
        hook_com[hg-bookmark-string]="${(Mj:,:)@}"
        ret=1
    fi
}

function +vi-hg-message() {
    emulate -L zsh

    # Suppress hg branch display if we can display a bookmark instead.
    if [[ -n "${hook_com[misc]}" ]]; then
        hook_com[branch]=''
    fi
    return 0
}

function +vi-git-untracked() {
    emulate -L zsh
    if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
        hook_com[unstaged]+="%F{blue}●%f"
    fi
}

# Compare local changes to remote changes
# Make sure you have added misc to your 'formats':  %m
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # for git prior to 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "%F{magenta}●%f" )

    # for git prior to 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "%F{yellow}●%f" )

    hook_com[misc]+=${(j:/:)gitstatus}
}

#
# Vi-mode indicator and PROMPT (PS1)
#

# zle-keymap-select is executed every time KEYMAP changes.
# zle-line-init is executed every time the shell started to read a new line of input.
function zle-line-init zle-keymap-select {

    # Vi-mode indicators
    local MODE_INDICATOR=" %{$fg_bold[yellow]%}>>>%{$reset_color%} "
    local VIMODE="${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"

    # Look if tmux is runnit that way it doesn't have to nested another term
    if tmux info &> /dev/null; then
        # In a a tmux session created in a non-root or root shell.
        # LVL decide how many right brackets you have on nested shells
        local LVL=$(($SHLVL - 1))
    else
        # Either in a root shell created inside a non-root tmux session,
        # or not in a tmux session.
        local LVL=$(($SHLVL))
    fi

    if [[ $EUID -eq 0 ]]; then
        # root simbol
        local SUFFIX=$(printf '%%F{red}#%.0s%%f' {1..$LVL})
    else
        # normal user simbol
        local SUFFIX=$(printf '%%F{red}$%.0s%%f' {1..$LVL})
    fi

    PROMPT="%F{green}${SSH_TTY:+%n@%m}%f%B${SSH_TTY:+:}%b%F{blue}%B%1~%b%F{yellow}%B%(1j.*.)%(?..!)%b %f%B${SUFFIX}%b ${VIMODE}"

    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Adding right prompt, contents: time and branch
RPROMPT_BASE='${vcs_info_msg_0_}'

export RPROMPT=$RPROMPT_BASE
export SPROMPT="Correct %F{red}'%R'%f to %F{blue}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

#
# Hooks
#

autoload -U add-zsh-hook

# $HISTCMD (the current history event number) is shared across all shells
# (due to SHARE_HISTORY). Maintain this local variable to count the number of
# commands run in this specific shell.
HISTCMD_LOCAL=0

#
# Time on RPROMPT
#

typeset -F SECONDS

function -record-start-time() {
    emulate -L zsh
    ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec -record-start-time

function -report-start-time() {
    emulate -L zsh
    if [ $ZSH_START_TIME ]; then
        local DELTA=$(($SECONDS - $ZSH_START_TIME))
        local DAYS=$((~~($DELTA / 86400)))
        local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
        local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
        local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
        local ELAPSED=''
        test "$DAYS" != '0' && ELAPSED="${DAYS}d"
        test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
        test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
        if [ "$ELAPSED" = '' ]; then
        SECS="$(print -f "%.2f" $SECS)s"
        elif [ "$DAYS" != '0' ]; then
        SECS=''
        else
        SECS="$((~~$SECS))s"
        fi
        ELAPSED="${ELAPSED}${SECS}"
        export RPROMPT="%F{cyan}%{$__FREDO[ITALIC_ON]%}${ELAPSED}%{$__FREDO[ITALIC_OFF]%}%f $RPROMPT_BASE"
        unset ZSH_START_TIME
    else
        export RPROMPT="$RPROMPT_BASE"
    fi
}
add-zsh-hook precmd -report-start-time

function -auto-ls-after-cd() {
    emulate -L zsh
    # Only in response to a user-initiated `cd`, not indirectly (eg. via another function).
    if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
        ls -a
    fi
}
add-zsh-hook chpwd -auto-ls-after-cd

# Call vcs_info as precmd before every prompt.
prompt_precmd() {
    vcs_info
}
add-zsh-hook precmd prompt_precmd

