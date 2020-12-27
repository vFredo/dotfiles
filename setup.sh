#!/bin/bash

# TODO: Finish the  *.list  packages that has to be install. DO IT!

function install_vim(){
    # echo "Installing Vim dependencies..."
    # ./packages/installer.sh vim

    echo "Creating necessary folders..."
    mkdir -p ~/.vim/tmp/backup ~/.vim/tmp/swap ~/.vim/tmp/view

    echo "Creating symbolic links for vim..."
    ln -sf "$(pwd)"/vim/vimrc ~/.vimrc
    ln -sf "$(pwd)"/vim/plugin ~/.vim/
    ln -sf "$(pwd)"/vim/coc-settings.json ~/.vim/coc-settings.json

    echo "Installing vim-plug and plugins..."
    # Installing vim-plug package manager for Vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Installing/Updating vim plugins
    vim +PlugInstall +PlugUpdate +qall

    echo "Check Neovim installation..."
    if command -v nvim &> /dev/null
    then
        mkdir -p ~/.config/nvim
        ln -sf "$(pwd)"/vim/coc-settings.json ~/.config/nvim/coc-settings.json
        ln -sf "$(pwd)"/vim/init.vim ~/.config/nvim/init.vim
    fi

    echo "DONE - Vim installation."
}

function install_i3(){
    # echo "Installing i3 dependencies..."
    # ./packages/installer.sh i3

    echo "Creating necessary folders..."
    mkdir -p ~/.config/i3status

    echo "Creating symbolic links for i3 and polybar..."
    ln -sf "$(pwd)"/config/i3/config ~/.i3/config
    ln -sf "$(pwd)"/config/betterlockscreenrc ~/.config/betterlockscreenrc
    ln -sf "$(pwd)"/config/ranger ~/.config/
    ln -sf "$(pwd)"/config/dunstrc ~/.config/dunst/dunstrc
    ln -sf "$(pwd)"/config/rofi ~/.config/
    ln -sf "$(pwd)"/config/i3/i3status.conf ~/.config/i3status/config
    ln -sf "$(pwd)"/config/polybar ~/.config/

    echo "DONE - i3 installation."
}

function install_term(){
    # echo "Installling terminal dependencies..."
    # ./packages/installer.sh term

    echo "Creating folders need it..."
    mkdir -p ~/.fonts

    echo "Installing Oh-My-Zsh and autosuggestion on zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "Install base16_themes..."
    git clone https://github.com/chriskempson/base16-shell.git \
        ~/.config/base16-shell

    echo "Installing fonts..."
    cp -r "$(pwd)"/fonts/*.ttf ~/.fonts
    fc-cache -f -v

    echo "Creating symbolic links for terminal..."
    ln -sf "$(pwd)"/bash/Xresources ~/.Xresources
    ln -sf "$(pwd)"/bash/bashrc ~/.bashrc
    ln -sf "$(pwd)"/bash/profile ~/.profile
    ln -sf "$(pwd)"/bash/bash_aliases ~/.bash_aliases
    ln -sf "$(pwd)"/config/tmux.conf ~/.tmux.conf
    ln -sf "$(pwd)"/zsh/zshrc ~/.zshrc
    ln -sf "$(pwd)"/zsh/fredo.zsh-theme ~/.oh-my-zsh/custom/themes/fredo.zsh-theme
    ln -sf "$(pwd)"/bash/agignore ~/.agignore

    echo "DONE - terminal installation."
}

function install_latex(){
    # echo "Installing Latex dependencies..."
    # ./packages/installer.sh latex

    echo "Creating folders need it..."
    mkdir -p ~/.config/zathura

    echo "Creating symbolic links for latex..."
    ln -sf "$(pwd)"/config/zathura/zathurarc ~/.config/zathura/zathurarc
    ln -sf "$(pwd)"/config/latexmkrc ~/.latexmkrc

    echo "DONE - Latex installation."
}

function help_tag(){
    echo "Options for the installation:"
    echo "      --i3       Install config files for i3."
    echo "      --vim      Install config files for vim/nvim."
    echo "      --latex    Install config files for latex."
    echo "      --term     Install config files for the terminal."
    echo "      --all      To install all the config files."
    echo "More information about the files on the README."
}

if [[ ! $# -eq 0 ]]
then
  while [ ! $# -eq 0 ]
  do
      case "$1" in
          --help | -h)
              help_tag
              ;;
          --i3)
              install_i3
              ;;
          --vim)
              install_vim
              ;;
          --latex)
              install_latex
              ;;
          --term)
              install_term
              ;;
          --all)
              install_i3
              install_term
              install_vim
              install_latex
              ;;
          *) echo "Choose a valid option, see options with --help or -h flags.";;
      esac
      shift
  done
else
  echo "Choose which config files you want to install, see the list with -h or --help flags."
fi

