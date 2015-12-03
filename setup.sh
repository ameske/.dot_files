#!/bin/bash

# Symlink important dot files to their concrete versions in the repo
ln -s ~/.dot_files/bash/bashrc ~/.bashrc
ln -s ~/.dot_files/vimrc ~/.vimrc
ln -s ~/.dot_files/tmux.conf ~/.tmux.conf
if [ $( uname ) == 'Darwin' ]; then
    ln -s ~/.dot_files/osx/profile ~/.profile
fi

# Install vim and friends
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi

# Source the bashrc we just pulled down
source ~/.bashrc
