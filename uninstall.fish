#! /usr/bin/env fish

set DOTFILES_PATH (pwd)
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

rm $HOME/.vimrc
rm $HOME/.vim
rm $HOME/.tmux.conf

rm $XDG_CONFIG_HOME/nvim
rm $XDG_CONFIG_HOME/karabiner
rm $XDG_CONFIG_HOME/fish/fishfile
rm $XDG_CONFIG_HOME/fish/config.fish

fisher self-uninstall

