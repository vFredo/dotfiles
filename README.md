<div align="center">
  <h1>━━━━  ❖  ━━━━</h1>
  <img src="https://raw.githubusercontent.com/fredo0522/dotfiles/media/bspwm-rice.png" />
  <img src="https://raw.githubusercontent.com/fredo0522/dotfiles/media/nvim-screenshot.png" />
  <h1>━━━━  ❖  ━━━━</h1>
  <br />
  <h1>System configuration</h1>
</div>

This configuration are set for my GNU/Linux operating systems, this is really intended for my own use,
but you can steal it and modified if you want to. There is a `install` script to configure
the files, to see the options run `./install --help`. This script creates backup copies of the current
configurations that you have, but if the file that is trying to change is a symbolic link, then, if
you want, the script removes it. For the moment, most dependencies have to be install by hand.

## ❖ Features
* i3 gaps config.
  * Bettterlockscreen config file (alternative for i3lock).
  * Polybar config.
* Bspwm config files.
* Rofi configurations.
* Zathura (PDF reader) config.
* Neovim config files.
* Tmux config.
* Alacritty/Kitty terminal configurations.

### ❖ Zsh
<div align="center">
  <img src="https://raw.githubusercontent.com/fredo0522/dotfiles/media/zsh-prompt.png"/>
</div>

This are the plugins that I'm using:
- [`pure`](https://github.com/sindresorhus/pure) - Minimal and fast Zsh prompt with asynchronous git fetch
- [`autopair`](https://github.com/hlissner/zsh-autopair) - Auto-close and delete matching delimiters
- [`system-clipboard`](https://github.com/kutsan/zsh-system-clipboard) - Synchronize ZLE (Zsh Line Editor) clipboard buffer with system clipboard
- [`autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like auto-suggestions for zsh based on command history

For updating all submodules use `git pull --recurse-submodules`

### ❖ Theme
* Current terminal: [Kitty](https://sw.kovidgoyal.net/kitty/).
* Terminal font: [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts).

## ❖ Dependencies
* Neovim
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
* Zsh
* i3 gaps
  * [Rofi](https://github.com/davatorium/rofi).
  * [bitwarden-rofi](https://github.com/mattydebie/bitwarden-rofi).
  * [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen).
  * [polybar](https://github.com/polybar/polybar).
  * Blueman (bluetooth manager with applet).
  * Picom
  * Nitrogen
  * Dunst
* Bspwm
  * sxhkd
  * dunst
  * arandr
  * picom
  * nitrogen
  * [polybar](https://github.com/polybar/polybar).
  * pavucontrol
  * [Rofi](https://github.com/davatorium/rofi).
  * [bitwarden-rofi](https://github.com/mattydebie/bitwarden-rofi).
  * xorg-xsetroot
  * lxappearance-gtk3
* Tmux
  * Xclip `pacman -S xclip`(copy on clipboard from tmux paste mode).
* Latex
  * `apt-get install texlive-full` for Debian-based distros.
  * `pacman -S texlive-most texlive-lang` for Arch-based distros.

# ❖ Inspired
* Gilles Castel's [blog](https://castel.dev/); I got his snippets in this repository.
* The theme colors and some neovim configurations comes from TheRealKizu [dotfiles](https://github.com/TheRealKizu/dotfiles) and his [neovim repo](https://github.com/TheRealKizu/neodots).
* Other Neovim lua configuration comes from [NvChad](https://github.com/NvChad/NvChad).
* Kutsan's [dotfiles](https://github.com/kutsan/dotfiles). I'm using a lot of things of his Zsh configuration.
