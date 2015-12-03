#!/bin/bash

rm ~/.bashrc
rm ~/.vimrc
rm ~/.tmux.conf
if [ $( uname ) == 'Darwin' ]; then
    rm ~/.profile
fi

rm -rf ~/.vim/autoload
rm -rf ~/.vim/bundle
rm -rf ~/.fzf
rm ~/.fzf.bash
rm ~/.fzf.zsh
