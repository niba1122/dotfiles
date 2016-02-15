#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

if [ -e $HOME/.oh-my-zsh ]; then
  mv $HOME/.oh-my-zsh $HOME/_oh-my-zsh
fi
if [ -e $HOME/.zshrc ]; then
  mv $HOME/.zshrc $HOME/_zshrc
fi
if [ -e $HOME/.vimrc ]; then
  mv $HOME/.vimrc $HOME/_vimrc
fi
if [ -e $HOME/.vim ]; then
  mv $HOME/.vim $HOME/_vim
fi
if [ -e $HOME/.tmux.conf ]; then
  mv $HOME/.tmux.conf $HOME/_tmux_conf
fi

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

vim -c NeoBundleInstall -c q

cd $DOTFILES_PATH/.vim/bundle/vimproc
make
cd $DOTFILES_PATH
