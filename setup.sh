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
        ln -sf "$(pwd)"/config/tmux.conf /"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/vim/vimrc /"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/vim/plugin /"$(whoami)"/.vim/
        ln -sf "$(pwd)"/bash/bashrc /"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /"$(whoaim)"/.bash_aliases
        ln -sf "$(pwd)"/config/i3/config /"$(whoami)"/.config/i3/config
        ln -sf "$(pwd)"/config/rofi/config.rasi /"$(whoami)"/.config/rofi/config.rasi
        ln -sf "$(pwd)"/config/rofi/flat-orange.rasi /"$(whoami)"/.config/rofi/flat-orange.rasi
        ln -sf "$(pwd)"/config/zathura/zathurarc /"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/scripts/extract-file /"$(whoami)"/.scripts/extract-file
        ln -sf "$(pwd)"/config/latexmkrc /"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/config/compton.conf /"$(whoaim)"/.config/compton.conf
        ln -sf "$(pwd)"/config/polybar/launch.sh /"$(whoami)"/.config/polybar/launch.sh
        ln -sf "$(pwd)"/config/polybar/config /"$(whoami)"/.config/polybar/config
        ln -sf "$(pwd)"/config/polybar/spotify /"$(whoami)"/.config/polybar/
        ln -sf "$(pwd)"/config/polybar/bluetooth.sh /"$(whoami)"/.config/polybar/bluethooth.sh
        ln -sf "$(pwd)"/zsh/zshrc /"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme

        # Not Root
    else
        ln -sf "$(pwd)"/config/tmux.conf /home/"$(whoami)"/.tmux.conf
        ln -sf "$(pwd)"/vim/vimrc /home/"$(whoami)"/.vimrc
        ln -sf "$(pwd)"/vim/plugin /home/"$(whoami)"/.vim/
        ln -sf "$(pwd)"/bash/bashrc /home/"$(whoami)"/.bashrc
        ln -sf "$(pwd)"/bash/profile /home/"$(whoami)"/.profile
        ln -sf "$(pwd)"/bash/bash_aliases /home/"$(whoami)"/.bash_aliases
        ln -sf "$(pwd)"/config/i3/config /home/"$(whoami)"/.config/i3/config
        ln -sf "$(pwd)"/config/rofi/config.rasi /home/"$(whoami)"/.config/rofi/config.rasi
        ln -sf "$(pwd)"/config/rofi/flat-orange.rasi /home/"$(whoami)"/.config/rofi/flat-orange.rasi
        ln -sf "$(pwd)"/config/zathura/zathurarc /home/"$(whoami)"/.config/zathura/zathurarc
        ln -sf "$(pwd)"/scripts/extract-file /home/"$(whoami)"/.scripts/extract-file
        ln -sf "$(pwd)"/bash/latexmkrc /home/"$(whoami)"/.latexmkrc
        ln -sf "$(pwd)"/config/compton.conf /home/"$(whoami)"/.config/compton.conf
        ln -sf "$(pwd)"/config/polybar/launch.sh /home/"$(whoami)"/.config/polybar/launch.sh
        ln -sf "$(pwd)"/config/polybar/config /home/"$(whoami)"/.config/polybar/config
        ln -sf "$(pwd)"/config/polybar/spotify /home/"$(whoami)"/.config/polybar/
        ln -sf "$(pwd)"/config/polybar/bluetooth.sh /home/"$(whoami)"/.config/polybar/bluetooth.sh
        ln -sf "$(pwd)"/zsh/zshrc /home/"$(whoami)"/.zshrc
        ln -sf "$(pwd)"/zsh/fredo.zsh-theme /home/"$(whoami)"/.oh-my-zsh/custom/themes/fredo.zsh-theme
    fi

    # Intalling Plug Package Manager
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Installing vim plugins
    vim +PlugInstall +qall

    # Adding own Lightline theme
    cp "$(pwd)"/vim/fredoLightline.vim ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/

    # Copy all Fonts
    cp "$(pwd)"/fonts/*.ttf ~/.fonts/ && cp "$(pwd)"/fonts/*.otf ~/.fonts/

fi

