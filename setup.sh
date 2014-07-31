#!/bin/bash

# Fetch my configuration files and symlink them in
git clone https://github.com/ameske/.dot_files.git
ln -s .dot_files/.vimrc .vimrc
ln -s .dot_files/.tmux.conf .tmux.conf
ln -s .dot_files/.bashrc .bashrc
ln -s .dot_files/.bash_aliases .bash_aliases

# Fetch and install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
