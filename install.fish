#! /usr/bin/env fish

set DOTFILES_PATH (pwd)
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

if [ ! -e $XDG_CONFIG_HOME ]
  mkdir ~/.config
end

#ln -nfs $DOTFILES_PATH/.oh-my-zsh/ $HOME/.oh-my-zsh
#ln -nfs $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES_PATH/vim/init.vim $HOME/.vimrc
ln -nfs $DOTFILES_PATH/vim/ $HOME/.vim
ln -nfs $DOTFILES_PATH/tmux.conf $HOME/.tmux.conf

ln -nfs $DOTFILES_PATH/vim $XDG_CONFIG_HOME/nvim
ln -nfs $DOTFILES_PATH/karabiner $XDG_CONFIG_HOME/karabiner
ln -nfs $DOTFILES_PATH/fish/fishfile $XDG_CONFIG_HOME/fish/fishfile
ln -nfs $DOTFILES_PATH/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish

git submodule init
git submodule update

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
end
fish -c fisher

vim -c 'call dein#install()' -c q
if type nvim > /dev/null 2>&1
  nvim -c 'call dein#install()' -c q
end

