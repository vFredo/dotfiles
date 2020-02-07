#!/bin/bash

# Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    # Create folders need it if they don't exist already
    mkdir -p ~/.config/zathura ~/.fonts ~/.vim/tmp/backup ~/.vim/tmp/swap

    # Bae16 theme for the shell
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

    #Ask if the user is root
    if [ "root" = "$(whoami)" ]
    then
        # Terminal
        ln -sf "$(pwd)"/config/tmux.conf /"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/bash/Xresources /"$(whoami)"/.Xresources
        ln -sf "$(pwd)"/bash/bashrc /"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /"$(whoaim)"/.bash_aliases
        ln -sf "$(pwd)"/zsh/zshrc /"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme
        ln -sf "$(pwd)"/bash/agignore /"$(whoami)"/.agignore

        # Vim
        ln -sf "$(pwd)"/vim/plugin /"$(whoami)"/.vim/
        ln -sf "$(pwd)"/vim/vimrc /"$(whoami)"/.vimrc

        # WM related
        ln -sf "$(pwd)"/config/i3/config /"$(whoami)"/.i3/config
        ln -sf "$(pwd)"/config/betterlockscreenrc /"$(whoami)"/.config/betterlockscreenrc
        ln -sf "$(pwd)"/config/ranger/commands.py /"$(whoami)"/.config/ranger/commands.py
        ln -sf "$(pwd)"/config/ranger/rc.conf /"$(whoami)"/.config/ranger/rc.conf
        ln -sf "$(pwd)"/config/dunstrc /"$(whoami)"/.config/dunst/dunstrc
        ln -sf "$(pwd)"/config/rofi /"$(whoami)"/.config/

        # Latex
        ln -sf "$(pwd)"/config/zathura/zathurarc /"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/config/latexmkrc /"$(whoami)"/.latexmkrc

    else
        # Terminal
        ln -sf "$(pwd)"/bash/Xresources /home/"$(whoami)"/.Xresources
        ln -sf "$(pwd)"/bash/bashrc /home/"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /home/"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /home/"$(whoami)"/.bash_aliases
        ln -sf "$(pwd)"/config/tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/zsh/zshrc /home/"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /home/"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme
        ln -sf "$(pwd)"/bash/agignore /home/"$(whoami)"/.agignore

        # Vim
        ln -sf "$(pwd)"/vim/vimrc /home/"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/vim/plugin /home/"$(whoami)"/.vim/

        # WM
        ln -sf "$(pwd)"/config/i3/config /home/"$(whoami)"/.i3/config
        ln -sf "$(pwd)"/config/betterlockscreenrc /home/"$(whoami)"/.config/betterlockscreenrc
        ln -sf "$(pwd)"/config/ranger/commands.py /home/"$(whoami)"/.config/ranger/commands.py
        ln -sf "$(pwd)"/config/ranger/rc.conf /home/"$(whoami)"/.config/ranger/rc.conf
        ln -sf "$(pwd)"/config/dunstrc /home/"$(whoami)"/.config/dunst/dunstrc
        ln -sf "$(pwd)"/config/rofi /home/"$(whoami)"/.config/

        # Latex
        ln -sf "$(pwd)"/config/zathura/zathurarc /home/"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/config/latexmkrc /home/"$(whoami)"/.latexmkrc
    fi

    # Intalling vim-plug package manager for Vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Installing vim plugins
    vim +PlugInstall +PlugUpdate +qall

    # Install zsh-autosuggestions (Oh My Zsh has to be install)
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Installing and updating fonts for shell
    cp -r "$(pwd)"/fonts/*.ttf ~/.fonts
    fc-cache -f -v
fi

