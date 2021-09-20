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

  echo "DONE - Vim installation."
}

function install_neovim(){
  echo "Installing packer.nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

  echo "Creating symbolic links for vim..."
  ln -s `pwd`/config/nvim ~/.config/nvim

  echo "DONE - NeoVim installation."
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
  mkdir -p ~/.local/share/fonts


  echo "Installing fonts..."
  cp -r "$(pwd)"/fonts/* ~/.local/share/fonts
  fc-cache -f -v

  echo "Creating symbolic links for terminal..."
  ln -sf "$(pwd)"/bash/bash_aliases ~/.bash_aliases

  if command -v tmux &> /dev/null
  then
    ln -sf "$(pwd)"/config/tmux.conf ~/.tmux.conf
  fi

  if command -v alacritty &> /dev/null
  then
    echo "Creating symbolic links for alacritty configuration..."
    mkdir -p ~/.config/alacritty
    ln -sf "$(pwd)"/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  fi

  if command -v kitty &> /dev/null
  then
    echo "Creating symbolic links for kitty configuration..."
    mkdir -p ~/.config/kitty
    ln -sf "$(pwd)"/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
  fi

  if command -v ag &> /dev/null
  then
    echo "Creating symbolic links for ag (silver searcher) ..."
    ln -sf "$(pwd)"/bash/agignore ~/.agignore
  fi

  echo "DONE - terminal installation."
}

function install_bash(){
  install_term

  echo "Creating symbolic links for bash..."
  ln -sf "$(pwd)"/bash/Xresources ~/.Xresources
  ln -sf "$(pwd)"/bash/bashrc ~/.bashrc
  ln -sf "$(pwd)"/bash/profile ~/.profile
}

function install_zsh(){
  install_term

  echo "Installing Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Creating symbolic links for zsh..."
  ln -sf "$(pwd)"/zsh/fredo.zsh-theme ~/.oh-my-zsh/custom/themes/fredo.zsh-theme
  ln -sf "$(pwd)"/zsh/zshrc ~/.zshrc
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
  echo "      --vim      Install config files for vim."
  echo "      --nvim     Install config files for nvim."
  echo "      --latex    Install config files for latex."
  echo "      --zsh      Install config files for zsh."
  echo "      --bash     Install config files for bash."
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
      --nvim)
        install_neovim
        ;;
      --latex)
        install_latex
        ;;
      --zsh)
        install_zsh
        ;;
      --bash)
        install_bash
        ;;
      --all)
        install_i3
        install_zsh
        install_bash
        install_vim
        install_neovim
        install_latex
        ;;
      *) echo "Choose a valid option, see options with --help or -h flags.";;
    esac
    shift
  done
else
  echo "Choose which config files you want to install, see the list with -h or --help flags."
fi

