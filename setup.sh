#!/bin/bash

# If it is a Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    #Ask if is root
    if [ "root" = "$(whoami)" ]
    then
        ln -sf "$(pwd)"/.tmux.conf /"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/.vimrc /"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/.bashrc /"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/.profile /"$(whoami)"/.profile

        # Not Root
    else
        ln -sf "$(pwd)"/.tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/.vimrc /home/"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/.bashrc /home/"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/.profile /home/"$(whoami)"/.profile
    fi
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# ---- Preinstalations for terminal Theme-----
# sudo apt-get install dconf-cli
# If you are in a gnome terminal, Tilix terminal, iTerm or pathogen terminal

# https://github.com/Mayccoll/Gogh
# bash -c  "$(wget -qO- https://git.io/vQgMr)"
