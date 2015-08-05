"NeoBundle
if isdirectory(expand('~/.vim/bundle/'))
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
  endif

"  "insert here your Neobundle plugins"

  "NERDTree
  NeoBundle 'scrooloose/nerdtree'
  if !argc()
    autocmd vimenter * NERDTree|normal gg3j
  endif

  "lightline.vim
  NeoBundle 'itchyny/lightline.vim'
endif

"デザイン
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'separator': { 'left': '', 'right': '' },
      \ }

"solarizeの設定

set background=dark
colorscheme solarized

let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'


"検索時のハイライト
set hlsearch

"行番号
set number

"バックスペースを有効に
set backspace=start,eol,indent

"カーソルが行をまたぐように"
set whichwrap=<,>,[,]

"シンタックスをオンに
syntax on

"タブの設定
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"クリップボード設定
set clipboard=autoselect,unnamed

set nocompatible

