#!/bin/bash

# If it is a Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    # Create folders need it
    mkdir -p ~/.config/zathura ~/.fonts

    # Terminal theme related
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

    #Ask if is root
    if [ "root" = "$(whoami)" ]
    then
        ln -sf "$(pwd)"/config/tmux.conf /"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/vim/vimrc /"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/vim/plugin /"$(whoami)"/.vim/
        ln -sf "$(pwd)"/bash/bashrc /"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /"$(whoaim)"/.bash_aliases
        ln -sf "$(pwd)"/config/i3/config /"$(whoami)"/.i3/config
        ln -sf "$(pwd)"/config/zathura/zathurarc /"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/config/latexmkrc /"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/zsh/zshrc /"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme
        ln -sf "$(pwd)"/config/betterlockscreenrc /"$(whoami)"/.config/betterlockscreenrc
        ln -sf "$(pwd)"/config/ranger/commands.py /"$(whoami)"/.config/ranger/commands.py
        ln -sf "$(pwd)"/config/ranger/rc.conf /"$(whoami)"/.config/ranger/rc.conf

        # Not Root
    else
        ln -sf "$(pwd)"/config/tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/vim/vimrc /home/"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/vim/plugin /home/"$(whoami)"/.vim/
        ln -sf "$(pwd)"/bash/bashrc /home/"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /home/"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /home/"$(whoami)"/.bash_aliases
        ln -sf "$(pwd)"/config/i3/config /home/"$(whoami)"/.i3/config
        ln -sf "$(pwd)"/config/zathura/zathurarc /home/"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/bash/latexmkrc /home/"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/zsh/zshrc /home/"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /home/"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme
        ln -sf "$(pwd)"/config/betterlockscreenrc /home/"$(whoami)"/.config/betterlockscreenrc
        ln -sf "$(pwd)"/config/ranger/commands.py /home/"$(whoami)"/.config/ranger/commands.py
        ln -sf "$(pwd)"/config/ranger/rc.conf /home/"$(whoami)"/.config/ranger/rc.conf
    fi

    # Intalling Plug Package Manager
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Installing vim plugins
    vim +PlugInstall +qall

    # Adding own Lightline theme
    cp "$(pwd)"/vim/fredoLightline.vim ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/
fi

