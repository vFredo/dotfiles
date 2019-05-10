#!/bin/bash

# If it is a Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    # Create folders need it
    mkdir -p ~/.config/i3 ~/.config/polybar ~/.config/rofi ~/.config/zathura ~/.fonts ~/.scripts

    #Ask if is root
    if [ "root" = "$(whoami)" ]
    then
        ln -sf "$(pwd)"/.tmux.conf /"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/.vimrc /"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/.bashrc /"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/.profile /"$(whoami)"/.profile
        ln -sf "$(pwd)"/.config/polybar/launch.sh /"$(whoami)"/.config/polybar/launch.sh
        ln -sf "$(pwd)"/.config/polybar/config /"$(whoami)"/.config/polybar/config
        ln -sf "$(pwd)"/.config/i3/config /"$(whoami)"/.config/i3/config
        ln -sf "$(pwd)"/.config/rofi/config.rasi /"$(whoami)"/.config/rofi/config.rasi
        ln -sf "$(pwd)"/.config/rofi/flat-orange.rasi /"$(whoami)"/.config/rofi/flat-orange.rasi
        ln -sf "$(pwd)"/.config/zathura/zathurarc /"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/.scripts/extract-file /"$(whoami)"/.scripts/extract-file

        # Not Root
    else
        ln -sf "$(pwd)"/.tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/.vimrc /home/"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/.bashrc /home/"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/.profile /home/"$(whoami)"/.profile
        ln -sf "$(pwd)"/.config/polybar/launch.sh /home/"$(whoami)"/.config/polybar/launch.sh
        ln -sf "$(pwd)"/.config/polybar/config /home/"$(whoami)"/.config/polybar/config
        ln -sf "$(pwd)"/.config/i3/config /home/"$(whoami)"/.config/i3/config
        ln -sf "$(pwd)"/.config/rofi/config.rasi /home/"$(whoami)"/.config/rofi/config.rasi
        ln -sf "$(pwd)"/.config/rofi/flat-orange.rasi /home/"$(whoami)"/.config/rofi/flat-orange.rasi
        ln -sf "$(pwd)"/.config/zathura/zathurarc /home/"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/.scripts/extract-file /home/"$(whoami)"/.scripts/extract-file
    fi

    # Intalling Vundle Package Manager
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Copy all Fonts
    cp "$(pwd)"/.fonts/*.ttf ~/.fonts/ && cp "$(pwd)"/.fonts/*.otf ~/.fonts/

    # Copy modules spotify for polybar
    cp -r "$(pwd)"/.config/polybar/spotify ~/.config/polybar/

    # Installing vim plugins
    vim +PluginInstall +qall
fi

# ---- Preinstalations for terminal Theme-----
# sudo apt-get install dconf-cli
# If you are in a gnome-terminal, Tilix terminal or pathogen terminal

# https://github.com/Mayccoll/Gogh
# bash -c  "$(wget -qO- https://git.io/vQgMr)"
