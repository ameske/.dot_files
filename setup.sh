#!/bin/bash

#******************************************************************************
# setup.sh
#
# Installs configuration files to setup my preferred dev environment.
#
# Note: This script assumes the repo is located in a folder
# named .dot_files
#
# Author: Kyle Ames
# Date: Sep 16, 2014
#******************************************************************************

# Install zsh
curl -L http://install.ohmyz.sh | sh

# Symlink the dotfiles
ln -s ~/.dot_files/zsh/.zshrc .zshrc
ln -s ~/.dot_files/.vimrc .vimrc
ln -s ~/.dot_files/.tmux.conf .tmux.conf
ln -s ~/.dot_files/.bashrc .bashrc
ln -s ~/.dot_files/.bash_aliases .bash_aliases
cp ~/.dot_files/zsh/wedisagree.zsh-theme ~/.oh_my_zsh/themes/

# Source the config file
if [ $SHELL == "/bin/zsh" ]; then
    source ~/.zshrc
else
    source ~/.bashrc
fi

# Mercurial is needed for vim-go
if [ which apt-get ]; then
    sudo apt-get install mercurial
elif [ which yum ]; then
    sudo yum install mercurial
else
    sudo pacman -Sy mercurial
fi

# Fetch and install Vundle and its plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
