<div align="center">
  <h1>━━━━  ❖  ━━━━</h1>
  <img src="https://raw.githubusercontent.com/vFredo/dotfiles/main/.github/assets/bspwm-rice.png" />
  <img src="https://raw.githubusercontent.com/vFredo/dotfiles/main/.github/assets/nvim-screenshot.png" />
  <h1>━━━━  ❖  ━━━━</h1>
  <br />
  <h1>System configuration</h1>
</div>

This configuration are set for my GNU/Linux operating systems, this is really intended for my own use,
but you can steal it and modified if you want to. There is a `install` script to configure
the files, to see the options run `./install --help`. This script creates backup copies of the current
configurations that you have, but if the file that is trying to change is a symbolic link, then, if
you want, the script removes it. For the moment, most dependencies of the OS have to be install by hand.

## ❖ Features
* Bspwm config files.
  * Polybar config.
* Rofi configurations.
* Neovim config files.
* Tmux config.
* Kitty terminal configuration.
* Firefox theme

### ❖ Zsh
<div align="center">
  <img src="https://raw.githubusercontent.com/vFredo/dotfiles/main/.github/assets/zsh-prompt.png"/>
</div>

This are the plugins that I'm using:
- [`pure`](https://github.com/sindresorhus/pure) - Minimal and fast Zsh prompt with asynchronous git fetch
- [`autopair`](https://github.com/hlissner/zsh-autopair) - Auto-close and delete matching delimiters
- [`system-clipboard`](https://github.com/kutsan/zsh-system-clipboard) - Synchronize ZLE (Zsh Line Editor) clipboard buffer with system clipboard
- [`autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like auto-suggestions for zsh based on command history

For updating all submodules use `git pull --recurse-submodules`

### ❖ Firefox
You can install the custom Firefox CSS by first enabling toolkit.
`legacyUserProfileCustomizations.stylesheets` in `about:config` and move
the contents of `misc/firefox` to `$HOME/.mozilla/firefox/xxxxxxxx.default-release/chrome`.

## ❖ Dependencies
* Neovim
  * [ripgrep](https://github.com/BurntSushi/ripgrep)
  * nodejs
  * xclip
* Zsh
* Bspwm
  * [Capitaine Cursor](https://github.com/keeferrourke/capitaine-cursors)
  * [Rofi](https://github.com/davatorium/rofi).
  * [polybar](https://github.com/polybar/polybar).
  * [bitwarden-rofi](https://github.com/mattydebie/bitwarden-rofi).
  * Picom
  * Dunst
  * Nitrogen
  * arandr
  * xorg-xsetroot
  * pavucontrol
  * lxappearance-gtk3
  * Blueman (bluetooth manager with applet).
  * sxhkd
* Tmux
  * Xclip `pacman -S xclip`(copy on clipboard from tmux paste mode).

# ❖ Inspired
* The firefox theme and some other configurations comes from Janleight's [dotfiles](https://github.com/janleigh/dotfiles).
* Other Neovim lua configuration comes from [NvChad](https://github.com/NvChad/NvChad).
* Kutsan's [dotfiles](https://github.com/kutsan/dotfiles). I'm using a lot of things of his Zsh configuration.
* Some nvim lazy loading configs comes from Ray-x's [dotfiles](https://github.com/ray-x/nvim).
