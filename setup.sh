#!/bin/bash

# Symlink important dot files to their concrete versions in the repo
ln -s ~/.dot_files/bash/bashrc ~/.bashrc
ln -s ~/.dot_files/vimrc ~/.vimrc
ln -s ~/.dot_files/tmux.conf ~/.tmux.conf
if [ $( uname ) == 'Darwin' ]; then
    ln -s ~/.dot_files/osx/profile ~/.profile
fi

# Get fzf if we haven't yet
if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# Get vim-plug if we haven't yet
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
fi

# Source the bashrc we just pulled down
source ~/.bashrc
