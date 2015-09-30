"NeoBundle
if isdirectory(expand('~/.dotfiles/.vim/bundle/'))
  if has('vim_starting')
    set runtimepath+=~/.dotfiles/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.dotfiles/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
  endif

"  "insert here your Neobundle plugins"

  "NERDTree
  NeoBundle 'scrooloose/nerdtree'
  autocmd vimenter * nested if @% == '' && s:GetBufByte() == 0 | NERDTree | endif
  nnoremap <C-n> :NERDTree<Enter>

  "NERDTree以外のバッファがなくなったときにNERDTreeを閉じる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  "lightline.vim
  NeoBundle 'itchyny/lightline.vim'
endif

"標準入力時の動作をless風に
autocmd StdinReadPost * nnoremap q :q!<Enter>

"コマンドラインモードでデフォルトでコマンドラインウィンドウを使うようにする
nnoremap : q:
nnoremap / q:/\v
autocmd CmdwinEnter * call s:cmdwin_enter()
autocmd CmdwinLeave * call s:cmdwin_leave()
function! s:cmdwin_enter()
  inoremap <C-C> <ESC>:q<ENTER>
  nnoremap <C-C> :q<ENTER>
  nnoremap : <nop>
  normal j
  startinsert
endfunction
function! s:cmdwin_leave()
  inoremap <C-C> <C-C>
  nnoremap <C-C> <C-C>
  nnoremap : q:
endfunction

"q:でコマンドラインウィンドウを開かないようにする

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

"コマンドラインモードでのタブキーでの補完
set wildmenu

set nocompatible

"検索で正規表現
"nnoremap /  /\v

"バッファ文字数を数える関数
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
