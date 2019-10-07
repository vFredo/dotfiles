# Dotfiles and system configurations

This configuration are set for Linux operating system, this is really intendent for my own use.  There is a [setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) script to configure the files (the setup don't install all dependencies need it).

## Features
  * i3 config file
    * Compton
    * flashfocus
    * Required Betterlockscreen
        * i3lock-color
        * Imagemagick
        * xdpyinfo, xrandr, bc and feh
  * Polybar config file
    * Required dbus-python (a module to run spotify on the bar)
  * Rofi config file (alternative of dmenu)
  * Ranger terminal configurations (needed to open files with alias)
  * Zathura (PDF reader) config file
  * Tmux config file
  * Latexmk compiler config file
  * Dots on prompt (`● \u25CF`) for information of current version control folder (use `git remote update` for pull option information to appear).

## Bash
   * Change cursor for vi-mode on shell.
   * Current version control branch name.
       * Red dot indicates unstaged changes.
   	   * Yellow dot indicates push to the current remote repo.
   	   * Magenta dot indicates pull to the current remote repo.
   

## Zsh
  * Requiered [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
  * Extended right-hand size prompt which auto-hides when necessary to make room for long commands and contains:
      * If you are on vi-mode `<<<` will appear.
      * Duration of previous command in adaptive units (seconds, minutes, hours, days, depending on duration).
      * Current version control branch name.
	  	* Green dot indicates staged changes.
          	* Red dot indicates unstaged changes.
         	* Blue dot indicates untracked files.
          	* Yellow dot indicates push to the current remote repo.
          	* Magenta dot indicates pull to the current remote repo.

## Theme
   * Terminal Theme: [base16_material-darker](https://github.com/chriskempson/base16-shell).
   * Font: [Source Code Pro Regular](https://github.com/adobe-fonts/source-code-pro).

