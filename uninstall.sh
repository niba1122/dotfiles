#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

rm $HOME/.oh-my-zsh
rm $HOME/.zshrc
rm $HOME/.vimrc
rm $HOME/.vim
rm $HOME/.tmux.conf
rm $HOME/.hammerspoon

cd $HOME
rm -rf .dotfiles
