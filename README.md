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
* Ranger configurations (terminal file manager).
* Zathura (PDF reader) config.
* Vim/Neovim config files.
* Tmux config.
* Alacritty and Kitty configs.
* Latexmk compiler config.
* Bash: Dots on prompt (`● \u25CF`) for information of current version control folder (use `git remote update` for pull option information to appear).
* Rofi configurations.

## ❖ Google Drive
* For cloud storage I use [drive](https://github.com/odeke-em/drive) ([AUR repo](https://aur.archlinux.org/packages/drive-bin)).

### ❖ Bash
* Current version control branch name.
  * Red dot indicates unstaged changes.
  * Magenta dot indicates push to the current remote repo.
  * Yellow dot indicates pull to the current remote repo.

### ❖ Zsh
<div align="center">
  <img src="https://github.com/fredo0522/dotfiles/blob/media/zsh-prompt.png"/>
</div>

This are the plugins that I'm using:
- [`pure`](https://github.com/sindresorhus/pure) - Minimal and fast Zsh prompt with asynchronous git fetch
- [`autopair`](https://github.com/hlissner/zsh-autopair) - Auto-close and delete matching delimiters
- [`system-clipboard`](https://github.com/kutsan/zsh-system-clipboard) - Synchronize ZLE (Zsh Line Editor) clipboard buffer with system clipboard
- [`fast-syntax-highlighting`](https://github.com/kutsan/fast-syntax-highlighting) - Fish-like syntax highlighting support for interactive terminal
- [`autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like auto-suggestions for zsh based on command history

Updating each submodule use `git pull --recurse-submodules`

### ❖ Theme
* Current terminal: [Alacritty](https://github.com/alacritty/alacritty).
* Terminal font: [Caskaydia Cove Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).

## ❖ Dependencies
* Neovim
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
* Zsh
* i3 gaps
  * [Rofi](https://github.com/davatorium/rofi).
  * [bitwarden-rofi](https://github.com/mattydebie/bitwarden-rofi).
    * [bitwarden-cli](https://github.com/bitwarden/cli) you'll have to log in.
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
    * [bitwarden-cli](https://github.com/bitwarden/cli) you'll have to log in.
  * xorg-xsetroot
  * lxappearance-gtk3
* Ranger
  * Atool (extract files with <kbd>Shift + x</kbd> on ranger).
* Tmux
  * Xclip `pacman -S xclip`(copy on clipboard from tmux paste mode).
* Latex
  * `apt-get install texlive-full` for Debian-based distros.
  * `pacman -S texlive-most texlive-lang` for Arch-based distros.

# ❖ Inspired
* Wincent [dotfiles](https://github.com/wincent/wincent); Most of the technical things seen in this repository comes from his configuration.
* Gilles Castel's [blog](https://castel.dev/); I got his snippets in this repository.
* The theme colors and some neovim configurations comes from TheRealKizu [dotfiles](https://github.com/TheRealKizu/dotfiles) and his [neovim repo](https://github.com/TheRealKizu/neodots).
* Other Neovim lua configuration comes from [NvChad](https://github.com/NvChad/NvChad).
* Kutsan's [dotfiles](https://github.com/kutsan/dotfiles). I'm using a lot of things of his Zsh configuration.

