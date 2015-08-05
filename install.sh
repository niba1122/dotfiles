#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

if [ -d ~/.oh-my-zsh ]; then
  mv -R ~/.oh-my-zsh ~/_oh-my-zsh
fi
if [ -a ~/.zshrc ]; then
  mv ~/.zshrc ~/_zshrc
fi
if [ -a ~/.vimrc ]; then
  mv ~/.vimrc ~/_vimrc
fi
if [ -a ~/.vim ]; then
  mv -R ~/.vim ~/_vim
fi

ln -nfs $DOTFILES_PATH/.oh-my-zsh/ $HOME/.oh-my-zsh
ln -nfs $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -nfs $DOTFILES_PATH/.vim/ $HOME/.vim
