#! /bin/bash

DOTFILES_PATH=$HOME'/.dotfiles'

ln -nfs $DOTFILES_PATH/.oh-my-zsh/ $HOME/.oh-my-zsh
ln -nfs $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -nfs $DOTFILES_PATH/.vim/ $HOME/.vim
ln -nfs $DOTFILES_PATH/.tmux.conf $HOME/.tmux.conf

if [ ! -e $HOME/.config ]; then
  mkdir ~/.config
fi
ln -nfs $DOTFILES_PATH/.vim $HOME/.config/nvim
ln -nfs $DOTFILES_PATH/karabiner $HOME/.config/karabiner

if [ -e $HOME/dotfiles ]; then
  mv $HOME/dotfiles $HOME/.dotfiles
fi

cd $HOME
cd $DOTFILES_PATH

git submodule init
git submodule update

vim -c 'call dein#install()' -c q
if type nvim > /dev/null 2>&1; then
  nvim -c 'call dein#install()' -c q
fi

cd $DOTFILES_PATH/.vim/bundle/vimproc
make
cd $DOTFILES_PATH
