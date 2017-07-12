"NeoBundle
if isdirectory(expand('~/.dotfiles/.vim/bundle/'))
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim

  if dein#load_state('~/.dotfiles/.vim/bundle/')
    call dein#begin('~/.dotfiles/.vim/bundle/')

    call dein#add('~/.dotfiles/.vim/bundle/repos/github.com/Shougo/dein.vim')

    "unite.vim
    call dein#add('Shougo/unite.vim')

    "neoyank
    call dein#add('Shougo/neoyank.vim')

    "neomru
    call dein#add('Shougo/neomru.vim')

    "vimproc
    call dein#add('Shougo/vimproc')

    "VimFiler
    call dein#add('Shougo/vimfiler.vim')

    "lightline.vim
    call dein#add('itchyny/lightline.vim')

    "vim-quickrun
    call dein#add('thinca/vim-quickrun')

    "vim-elixir
    call dein#add('elixir-lang/vim-elixir')

    "vim-slim
    call dein#add('slim-template/vim-slim')
    "doctype htmlがある場合にハイライトされない問題への対応 https://github.com/slim-template/vim-slim/issues/38
    autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

    "vim-coffee-script
    call dein#add('kchmck/vim-coffee-script')

    "vim-endwise
    call dein#add('tpope/vim-endwise.git')

    "tmuxline.vim
    call dein#add('edkolev/tmuxline.vim')

    "yajs.vim
    call dein#add('othree/yajs.vim')

    "vim-jsx
    call dein#add('mxw/vim-jsx')

    call dein#end()
    call dein#save_state()
  endif

endif

runtime! userautoload/*.vim
