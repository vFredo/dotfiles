# Dotfiles and system configurations

This configuration are set for Linux operating systems, this is really intendent for my own use.  There is a [setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) script to configure the files (the setup don't install all dependencies need it).

## Features
* i3 gaps config.
    * bettterlockscreen config file (Alternative for i3lock).
* Ranger configurations (Terminal file manager).
* Polybar configurations.
* Zathura (PDF reader) config.
* Vim config files.
* Tmux config.
* Latexmk compiler config.
* Dots on prompt (`● \u25CF`) for information of current version control folder (use `git remote update` for pull option information to appear).

### Bash
* Current version control branch name.
    * Red dot indicates unstaged changes.
    * Magenta dot indicates push to the current remote repo.
    * Yellow dot indicates pull to the current remote repo.

### Zsh
* Extended right-hand size prompt which auto-hides when necessary to make room for long commands and contains:
    * If you are on vi-mode `<<<` will appear.
    * Duration of previous command in adaptive units (seconds, minutes, hours or days) depending on duration.
    * Current version control branch name.
        * Green dot indicates staged changes.
        * Red dot indicates unstaged changes.
        * Blue dot indicates untracked files.
        * Magenta dot indicates push to the current remote repo.
        * Yellow dot indicates pull to the current remote repo.

### Theme
* Current terminal: [simple terminal](https://st.suckless.org/)
* Terminal theme: [base16_default-dark](https://github.com/chriskempson/base16-shell).
* Terminal font: [Source Code Pro](https://github.com/adobe-fonts/source-code-pro).

#### Select Theme
* Run `base16_` and then hit tab (\t) to see all the themes available.

## Dependencies
* Fonts: Download and copy the next fonts on `~/.fonts` and then `fc-cache -f -v` to update your font cache, ([setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) do this on his own only for Souce Code fonts).
    * [Source Code Pro](https://github.com/adobe-fonts/source-code-pro).
    * [Material Icons](https://github.com/google/material-design-icons).
    * [Font Awesome](https://fontawesome.com/).
    * [Iosevka](https://github.com/be5invis/Iosevka/tree/master).
* Zsh
    * [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* i3 gaps
    * blueman
    * Compton
    * betterlockscreen
        * imagemagick
        * feh
        * xorg-xrandr
        * xorg-xdpyinfo
        * i3lock-color
* Ranger
    * atool
* Tmux
    * xclip
* Polybar
    * Dbus python

# Inspired
* Wincent [dotfiles](https://github.com/wincent/wincent); Most of the tecnical things seen in this repository comes from his dotfiles.

