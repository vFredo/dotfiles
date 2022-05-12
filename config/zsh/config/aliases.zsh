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
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal' # List name of nodes.
alias la='ls --almost-all --group-directories-first --literal' # List nodes with their details.
alias ll='ls -alF'

# Quick config changes
alias vb='vim ~/.bashrc'
alias vba='vim ~/.config/zsh/config/aliases.zsh'
alias vz='cd ~/.config/zsh && vim ~/.config/zsh/.zshrc'
alias vi3='vim ~/.i3/config'
alias vk='vim ~/.config/kitty/kitty.conf'
alias vbsp='vim ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc'

# Vim/neovim aliases
if command -v nvim &> /dev/null
then
  alias vim='nvim'
  alias vc='cd ~/.config/nvim && nvim init.lua'
elif command -v vim &> /dev/null
then
  alias vc='cd ~/.vim && vim ~/.vimrc'
fi

# Alacritty config alias
if command -v alacritty &> /dev/null
then
  alias va='vim ~/.config/alacritty/alacritty.yml'
fi

# Tmux config alias
if command -v tmux &> /dev/null
then
  alias vt='vim ~/.tmux.conf'
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
alias gsu='git submodule update'
alias gd='git diff'

# Extract files more easily
function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xf $1    ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
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
