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
    nnoremap <Space>n :NERDTree<Enter>

    "unite.vim
    NeoBundle 'Shougo/unite.vim'

    "NERDTree以外のバッファがなくなったときにNERDTreeを閉じる
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    let NERDTreeShowLineNumbers=1

    "lightline.vim
    NeoBundle 'itchyny/lightline.vim'

    "vim-quickrun
    NeoBundle 'thinca/vim-quickrun'

    "vim-elixir
    NeoBundle 'elixir-lang/vim-elixir'

    "vim-slim
    NeoBundle 'slim-template/vim-slim'

    "vim-coffee-script
    NeoBundle 'kchmck/vim-coffee-script'

    "vim-endwise
    NeoBundle 'tpope/vim-endwise.git'

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

"EXモードを使わない
nnoremap Q <nop>

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
  inoremap <silent> <buffer> <C-C> <ESC>:q<CR>
  nnoremap <silent> <buffer> <C-C> :q<CR>
  nnoremap <silent> <buffer> <C-_> /\v
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

"コマンドラインモードでのzsh風操作
cnoremap <C-A> <C-B>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <ESC> <nop>
cnoremap <ESC>b <S-Left>
cnoremap <ESC>f <S-Right>
cnoremap <C-D> <Del>

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


"検索をファイルの先頭へループしない
set nowrapscan

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

"ノーマルモードのxでレジスタに保存しない
nnoremap x "_x

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


"vim-quickrunショートカット
nnoremap <Space>q q:QuickRun<Space>

":set syntax=ショートカット
nnoremap <Space>s q:set<Space>syntax=

"vimgrepショートカット
nnoremap <Space>g q:vimgrep<Space><Space>\|<Space>cw<Esc>hhhhi

nnoremap <Space>h <C-W>h
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k
nnoremap <Space>l <C-W>l

"unite.vim諸ショートカット
nnoremap [unite] <nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]f :<C-U>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-U>Unite<Space>buffer<CR>
nnoremap <silent> [unite]r :<C-U>Unite<Space>register<CR>

