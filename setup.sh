#!/bin/bash

# Create folders need it if they don't exist already
mkdir -p ~/.config/zathura ~/.fonts ~/.vim/tmp/backup ~/.vim/tmp/swap ~/.vim/tmp/view ~/.config/i3status

# Bae16 theme for the shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Terminal
ln -sf "$(pwd)"/bash/Xresources ~/.Xresources
ln -sf "$(pwd)"/bash/bashrc ~/.bashrc
ln -sf "$(pwd)"/bash/profile ~/.profile
ln -sf "$(pwd)"/bash/bash_aliases ~/.bash_aliases
ln -sf "$(pwd)"/config/tmux.conf ~/.tmux.conf
ln -sf "$(pwd)"/zsh/zshrc ~/.zshrc
ln -sf "$(pwd)"/zsh/fredo.zsh-theme ~/.oh-my-zsh/custom/themes/fredo.zsh-theme
ln -sf "$(pwd)"/bash/agignore ~/.agignore

# Vim
ln -sf "$(pwd)"/vim/vimrc ~/.vimrc
ln -sf "$(pwd)"/vim/plugin ~/.vim/
ln -sf "$(pwd)"/vim/coc-settings.json ~/.vim/coc-settings.json

# i3
ln -sf "$(pwd)"/config/i3/config ~/.i3/config
ln -sf "$(pwd)"/config/betterlockscreenrc ~/.config/betterlockscreenrc
ln -sf "$(pwd)"/config/ranger/commands.py ~/.config/ranger/commands.py
ln -sf "$(pwd)"/config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf "$(pwd)"/config/dunstrc ~/.config/dunst/dunstrc
ln -sf "$(pwd)"/config/rofi ~/.config/
ln -sf "$(pwd)"/config/i3/i3status.conf ~/.config/i3status/config

# Latex
ln -sf "$(pwd)"/config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sf "$(pwd)"/config/latexmkrc ~/.latexmkrc

# Intalling vim-plug package manager for Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing/Updating vim plugins
vim +PlugInstall +PlugUpdate +qall

# Check in if Neovim is install
if command -v nvim &> /dev/null
then
    mkdir -p ~/.config/nvim
    ln -sf "$(pwd)"/vim/coc-settings.json ~/.config/nvim/coc-settings.json
    ln -sf "$(pwd)"/vim/init.vim ~/.config/nvim/init.vim
fi

# Install CoC extensions
vim -c "CocInstall -sync coc-sh coc-vimslp coc-python coc-clangd|qall"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Installing and updating fonts
cp -r "$(pwd)"/fonts/*.ttf ~/.fonts
fc-cache -fv

