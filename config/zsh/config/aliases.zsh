# local aliases
if [[ -e $HOME/.local_aliases ]]; then
  source $HOME/.local_aliases
fi

# basics
alias ..='cd ..'
alias ...='cd ../..'
alias doc='cd $HOME/Documents'
alias dot='cd $HOME/dotfiles'
alias fun='cd $HOME/Documents/fun'
alias dow='cd $HOME/Downloads'
alias usb='cd /run/media/$(whoami)/'
alias notes='cd $HOME/Documents/notes && $EDITOR index.org'
alias :q='exit'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mv='mv --interactive --verbose'
alias cp='cp --interactive --verbose'
alias ln='ln --interactive --verbose'
alias ls="ls --classify --color=auto --group-directories-first --literal --time-style='+%y-%b-%d %H:%M'"
alias la='ls --almost-all'
alias ll='ls -l --almost-all --human-readable --no-group'
alias llg='ls -l --almost-all --human-readable'

# Vim/Neovim aliases
alias v="$EDITOR"
if command -v nvim &> /dev/null
then
  alias vc='cd $HOME/.config/nvim && $EDITOR init.lua'
elif command -v vim &> /dev/null
then
  alias vc='cd $HOME/.vim && $EDITOR ~/.vimrc'
fi

# Quick config changes
alias vb='$EDITOR $HOME/.bashrc'
alias vba='$EDITOR $HOME/.config/zsh/config/aliases.zsh'
alias vz='cd $HOME/.config/zsh && $EDITOR $HOME/.config/zsh/.zshrc'
alias vk='$EDITOR $HOME/.config/kitty/kitty.conf'
alias vbspwm='$EDITOR $HOME/.config/bspwm/bspwmrc $HOME/.config/sxhkd/sxhkdrc'

# Tmux config alias
if command -v tmux &> /dev/null
then
  alias vt='$EDITOR $HOME/.tmux.conf'
  # mnemonic (t)mux (n)ew-(s)ession and put the name of the session ($1)
  function tns(){
    tmux new-session -d -s "$1" && tmux switch-client -t "$1"
  }
fi

# Git aliases
alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit -m'
alias gp='git push'
alias gl='git pull'
alias glsub='git pull --recurse-submodules'
alias gsub='git submodule update --remote --merge'
alias gd='git diff'

# paru and pacman helper
alias pacmanall='sudo pacman -Syyu'
alias paruall="paru -Syu --noconfirm"

# Helper for extracting files
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.rar) unrar x $1;;
      *.zip) unzip $1;;
      *.7z) 7z x $1;;
      *.Z) uncompress $1;;
      *.tar.gz) tar xzf $1;;
      *.gz) gunzip $1;;
      *.tgz) tar xzf $1;;
      *.tar.bz2) tar xjf $1;;
      *.bz2) bunzip2 $1;;
      *.tbz2) tar xjf $1;;
      *.tar.zst) unzstd $1;;
      *.tar.xz) tar xf $1;;
      *.tar) tar xf $1;;
      *.deb) ar x $1;;
      *) echo "'$1' cannot be extracted via extract()";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Run programs from terminal to open files
# https://unix.stackexchange.com/questions/577727/exceptions-with-xdg-open-when-starting-programs-in-the-background/577794#577794
function open() {
  for i in "$@"
  do
    mimetype=$(xdg-mime query filetype "$i")
    prog=$(xdg-mime query default "$mimetype")
    if grep -qs Terminal=true "/usr/share/applications/$prog"
    then
      xdg-open "$i"
    else
      xdg-open "$i" >/dev/null 2>/dev/null &
    fi
  done
}
