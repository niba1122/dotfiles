"NeoBundle
if isdirectory(expand('~/.dotfiles/.vim/bundle/'))
  if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.dotfiles/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.dotfiles/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    "NERDTree
    NeoBundle 'scrooloose/nerdtree'
    autocmd vimenter * nested if @% == '' && s:GetBufByte() == 0 | NERDTree | endif
    nnoremap Cn :NERDTree<Enter>

    "NERDTree以外のバッファがなくなったときにNERDTreeを閉じる
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    let NERDTreeShowLineNumbers=1

    "lightline.vim
    NeoBundle 'itchyny/lightline.vim'

    "vim-quickrun
    NeoBundle 'thinca/vim-quickrun'

    call neobundle#end()
  endif

endif

"autocmd bufenter * if (bufname(bufnr('%')) !~ "^NERD.*" ) | call s:commands_to_cmd_mode() | endif "NERDtree以外の場合のみ
"function! s:commands_to_cmd_mode()
"  nnoremap <buffer> : q:
"  nnoremap <buffer> / q:/
"  nnoremap <buffer> ? q:?
"  nnoremap <buffer> <C-_> q:/\v
"  nnoremap <buffer> <C-?> q:?\v
"  vnoremap <buffer> : q:
"  vnoremap <buffer> / q:/
"  vnoremap <buffer> ? q:?
"  vnoremap <buffer> <C-_> q:/\v
"  vnoremap <buffer> <C-?> q:?\v
"endfunction

"コマンドラインモードでデフォルトでコマンドラインウィンドウを使うようにする
nnoremap : q:
nnoremap / q:/
nnoremap ? q:?
nnoremap <C-_> q:/\v
"nnoremap <C-?> q:?\v
vnoremap : q:
vnoremap / q:/
vnoremap ? q:?
vnoremap <C-_> q:/\v
vnoremap <C-?> q:?\v


autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  inoremap <buffer> <C-C> <ESC>:q<CR>
  nnoremap <buffer> <C-C> :q<CR>
  nnoremap <buffer> <C-_> /\v
  "nnoremap <buffer> <C-?> ?\v
  nnoremap <buffer> / /
  nnoremap <buffer> ? ?
  normal j
  startinsert!
endfunction

"q:,q/,q?でコマンドラインウィンドウを開かないようにする(標準入力の場合を除く)
autocmd vimenter * nested if @% != '' && s:GetBufByte() > 0 | call s:disable_cmdwin_from_q() | endif

function! s:disable_cmdwin_from_q()
  nnoremap q: <nop>
  nnoremap q/ <nop>
  nnoremap q? <nop>
  vnoremap q: <nop>
  vnoremap q/ <nop>
  vnoremap q? <nop>
endfunction

"標準入力時の動作をless風に
autocmd StdinReadPost * nested nnoremap q :q!<Enter>

"カーソル無効
noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap! <Left> <nop>
noremap! <Right> <nop>
noremap! <Up> <nop>
noremap! <Down> <nop>

"コマンドラインモードでのカーソル移動
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"insertモードでのCtrl-Uを無効にする
inoremap <C-U> <nop>

"閉じ括弧自動入力
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap { {}<Left>
"inoremap < <><Left>

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
"set backspace=

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

"バッファ文字数を数える関数
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction

"独自コマンドに使うため無効化
nnoremap C <nop>

"vim-quickrunショートカット
nnoremap Cq q:QuickRun<Space>

":set syntax=ショートカット
nnoremap Cs q:set<Space>syntax=

"vimgrepショートカット
nnoremap Cg q:vimgrep<Space>
