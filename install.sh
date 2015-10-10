#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

ln -nfs $DOTFILES_PATH/.oh-my-zsh/ $HOME/.oh-my-zsh
ln -nfs $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -nfs $DOTFILES_PATH/.vim/ $HOME/.vim
ln -nfs $DOTFILES_PATH/.tmux.conf $HOME/.tmux.conf

if [ -e $HOME/dotfiles ]; then
  mv $HOME/dotfiles $HOME/.dotfiles
fi

cd $HOME
cd $DOTFILES_PATH

git submodule init
git submodule update
