# basics
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# default apps
if command -v nvim &> /dev/null
then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

# go files and paths
if command -v go &> /dev/null
then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOBIN
  export PATH=$PATH:/usr/local/go/bin
fi

# man pages
export MANPATH="/usr/local/man:$MANPATH"
export MANWIDTH='100'
export MANPAGER='nvim +Man!'

# npm cache and config
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
export NPM_CONFIG_TMP="$TMPDIR/npm"
