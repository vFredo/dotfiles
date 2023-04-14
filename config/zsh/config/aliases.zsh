# local aliases
if [[ -e ~/.local_aliases ]]; then
  source ~/.local_aliases
fi

# basics
alias ..='cd ..'
alias ...='cd ../..'
alias doc='cd ~/Documents'
alias dot='cd ~/dotfiles'
alias fun='cd ~/Documents/fun'
alias dow='cd ~/Downloads'
alias usb='cd /run/media/$(whoami)/'
alias :q='exit'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mv='mv --interactive --verbose'
alias cp='cp --interactive --verbose'
alias ln='ln --interactive --verbose'
alias ls="ls --classify --color=auto  --group-directories-first --literal --time-style='+%d-%b-%y'"
alias la='ls --almost-all'
alias ll='ls -l --almost-all --human-readable --no-group'

# Vim/neovim aliases
if command -v nvim &> /dev/null
then
  alias v='nvim'
  alias vc='cd ~/.config/nvim && nvim init.lua'
elif command -v vim &> /dev/null
then
  alias v='vim'
  alias vc='cd ~/.vim && vim ~/.vimrc'
fi

# Quick config changes
alias vb='$EDITOR ~/.bashrc'
alias vba='$EDITOR ~/.config/zsh/config/aliases.zsh'
alias vz='$EDITOR ~/.config/zsh && v ~/.config/zsh/.zshrc'
alias vk='$EDITOR ~/.config/kitty/kitty.conf'
alias vbsp='$EDITOR ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc'

# Tmux config alias
if command -v tmux &> /dev/null
then
  alias vt='$EDITOR ~/.tmux.conf'
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
alias gsu='git submodule update --remote --merge'
alias gd='git diff'

# paru and pacman helper
alias pacman='sudo pacman --color auto'
alias pacmanall='sudo pacman -Syyu'
alias paruall="paru -Syu --noconfirm"

# Helper for extracting files
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.zst) unzstd $1;;
      *.tar.bz2) tar xjf $1;;
      *.tar.gz) tar xzf $1;;
      *.tar.xz) tar xf $1;;
      *.bz2) bunzip2 $1;;
      *.rar) unrar x $1;;
      *.gz) gunzip $1;;
      *.tar) tar xf $1;;
      *.tbz2) tar xjf $1;;
      *.tgz) tar xzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
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
