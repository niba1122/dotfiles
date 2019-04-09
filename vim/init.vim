if &compatible
  set nocompatible
endif
set runtimepath+=/Users/niba/.dotfiles/vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dotfiles/vim/bundles/')
  call dein#begin('~/.dotfiles/vim/bundles/')
  call dein#load_toml('~/.dotfiles/vim/plugins.toml')
  call dein#end()
  call dein#save_state()
endif

runtime! userautoload/*.vim
