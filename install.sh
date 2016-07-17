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

vim -c NeoBundleInstall -c q

cd $DOTFILES_PATH/.vim/bundle/vimproc
make
cd $DOTFILES_PATH

if [ -e /Applications/Karabiner.app/ ]; then
  /Applications/Karabiner.app/Contents/Library/bin/karabiner be_careful_to_use__clear_all_values_by_name 'Default Profile'
  sh ./karabiner/keybind.sh
fi
