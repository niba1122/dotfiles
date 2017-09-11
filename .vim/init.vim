if &compatible
  set nocompatible
endif
set runtimepath+=~/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dotfiles/.vim/bundle/')
  call dein#begin('~/.dotfiles/.vim/bundle/')
  call dein#load_toml('~/.dotfiles/.vim/plugins.toml')
  call dein#end()
  call dein#save_state()
endif

runtime! userautoload/*.vim
