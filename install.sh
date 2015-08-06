#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

ln -nfs $DOTFILES_PATH/.oh-my-zsh/ $HOME/.oh-my-zsh
ln -nfs $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -nfs $DOTFILES_PATH/.vim/ $HOME/.vim
ln -nfs $DOTFILES_PATH/.tmux.conf $HOME/.tmux.conf
