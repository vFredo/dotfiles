# "dotfiles" and system configurations :floppy_disk:

This configuration are set for Linux operating system, this is really intendent for my own use.  There is a [setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) script to configure the files. Most of the dependecies have to be installed by hand.<br>

## Features
  * i3 config file
    * Compton
    * flashfocus
    * Required Betterlockscreen
        * i3lock-color
        * Imagemagick
        * xdpyinfo, xrandr, bc and feh
  * Polybar config file
    * Required dbus-python (A module to run spotify on the bar)
  * Rofi config file (Alternative of dmenu)
  * Ranger terminal configurations (Needed to open files with alias)
  * Zathura (PDF reader) config file
  * Tmux config file
  * Latexmk compiler config file
### Bash
  * Dots on prompt telling (`● \u25CF`):
       * To commit changes (purple).
       * To push changes (red).
       * To pull changes (green). Use `git remote update` on terminal to see the dot.
       * If all is good show a blue dot.
## Zsh
  * Extended right-hand size prompt which auto-hides when necessary to make room for long commands and contains:
      * Duration of previous command in adaptive units (seconds, minutes, hours, days, depending on duration).
      * Current version control branch name.
      * Current version control worktree status using colors that match those used in git status:
          * Green dot indicates staged changes.
          * Red dot indicates unstaged changes.
          * Blue dot indicates untracked files.

### Theme
   * Terminal Theme: [base16_material-darker.](https://github.com/chriskempson/base16-shell)
   * Font: [Source Code Pro Regular.](https://github.com/adobe-fonts/source-code-pro)

