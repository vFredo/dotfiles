#!/bin/bash

# If it is a Linux Base operating system
if [ "Linux" = "$(uname -a | awk '{printf $1}')" ]
then
    #Ask if is root
    if [ "root" = "$(whoami)" ]
    then
        ln -s "$(pwd)"/.tmux.conf /"$(whoami)"/.tmux.conf
        ln -s "$(pwd)"/.vimrc /"$(whoami)"/.vimrc
        ln -s "$(pwd)"/.bashrc /"$(whoami)"/.bashrc
        ln -s "$(pwd)"/.profile /"$(whoami)"/.profile

        # Not Root
    else
        ln -s "$(pwd)"/.tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -s "$(pwd)"/.vimrc /home/"$(whoami)"/.vimrc
        ln -s "$(pwd)"/.bashrc /home/"$(whoami)"/.bashrc
        ln -s "$(pwd)"/.profile /home/"$(whoami)"/.profile
    fi
fi

mkdir -p ~/.vim/autolad ~/.vim/bundle && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
