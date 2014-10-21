#!/bin/bash

# Symlink important dot files to their concrete versions in the repo
ln -s ~/.dot_files/bash/bashrc .bashrc
ln -s ~/.dot_files/vimrc .vimrc
ln -s ~/.dot_files/tmux.conf .tmux.conf
if [[ $( uname ) == 'Darwin' ]]; then
    ln -s ~/.dot_files/osx/profile .profile
fi

# Source everything for the next steps
source ~/.bashrc

# If we haven't set up vundle go ahead and do so
if [[ ! -f ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
