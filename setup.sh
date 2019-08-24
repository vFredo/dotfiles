#!/bin/bash

# If it is a Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    # Create folders need it
    mkdir -p ~/.config/i3 ~/.config/polybar ~/.config/rofi ~/.config/zathura ~/.fonts ~/.scripts

    # Terminal theme related
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

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
        ln -sf "$(pwd)"/.latexmkrc /"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/.config/compton.conf /"$(whoaim)"/.config/compton.conf

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
        ln -sf "$(pwd)"/.latexmkrc /home/"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/.config/compton.conf /home/"$(whoami)"/.config/compton.conf
    fi

    # Intalling Plug Package Manager
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Installing vim plugins
    vim +PlugInstall +qall

    # Copy all Fonts
    cp "$(pwd)"/.fonts/*.ttf ~/.fonts/ && cp "$(pwd)"/.fonts/*.otf ~/.fonts/

    # Copy modules spotify for polybar
    cp -r "$(pwd)"/.config/polybar/spotify ~/.config/polybar/
    cp "$(pwd)"/.config/polybar/bluetooth.sh ~/.config/polybar/

    # Terminal theme
    base16_gruvbox-dark-medium

fi

