"NeoBundle
if isdirectory(expand('~/.dotfiles/.vim/bundle/'))
  if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.dotfiles/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.dotfiles/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    "NERDTree
    "NeoBundle 'scrooloose/nerdtree'
    "autocmd vimenter * nested if @% == '' && s:GetBufByte() == 0 | NERDTree | endif
    "nnoremap <Space>n :NERDTree<Enter>

    "unite.vim
    NeoBundle 'Shougo/unite.vim'

    "neomru
    NeoBundle 'Shougo/neomru.vim'

    "vimproc
    NeoBundle 'Shougo/vimproc'

    "VimFiler
    NeoBundle 'Shougo/vimfiler.vim'

    "NERDTree以外のバッファがなくなったときにNERDTreeを閉じる
    "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    "let NERDTreeShowLineNumbers=1

if has('mac')
    "lightline.vim
    NeoBundle 'itchyny/lightline.vim'
endif

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
  inoremap <buffer><expr> <C-p> g:CmdwinPrevious()
  inoremap <buffer><expr> <C-n> g:CmdwinNext()
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

"デザイン&カラースキーム
set laststatus=2
if !has('gui_running')
  "set t_Co=256
  set t_Co=16
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'separator': { 'left': '', 'right': '' },
      \ }

set background=dark
colorscheme jellybeans
"let g:jellybeans_overrides = {
"\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
"\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
"\              'attr': 'bold' },
"\}
"let g:jellybeans_use_lowcolor_black = 0

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

"neomru日時
let g:neomru#time_format = "(%Y/%m/%d %H:%M:%S) "

"vimfilerショートカット
nnoremap <Space>f :VimFiler<Space>-split<Space>-winwidth=35<Space>-simple<Space>-no-quit<CR>

" ag(The Silver Searcher)が使えればunite grepに ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"unite.vim諸ショートカット
nnoremap [unite] <nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]u :<C-U>Unite<CR>
nnoremap <silent> [unite]f :<C-U>UniteWithBufferDir<Space>-buffer-name=files<Space>file<CR>
nnoremap <silent> [unite]b :<C-U>Unite<Space>buffer<CR>
nnoremap <silent> [unite]r :<C-U>Unite<Space>register<CR>
nnoremap <silent> [unite]m :<C-U>Unite<Space>file_mru<CR>

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> x     <Plug>(unite_quick_match_jump)

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+lで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  "Ctrl-Cで閉じる
  nmap <buffer> <C-c> :q<CR>
  imap <buffer> <C-c> <ESC>:q<CR>

  imap <buffer><expr> <BS> g:UniteFileBackspace()

  imap <buffer> <C-h> <BS>

endfunction

function! CmdwinPrevious()
  if col('.') == 1 || (col('.') == 2 && getline('.')[0] == '/')
    call feedkeys("\<ESC>k^i",'n')
  else
    call feedkeys("\<C-p>",'n')
  endif
  return ''
endfunction

function! CmdwinNext()
  if col('.') == 1 || (col('.') == 2 && getline('.')[0] == '/')
    call feedkeys("\<ESC>j^i",'n')
  else
    call feedkeys("\<C-n>",'n')
  endif
  return ''
endfunction

function! UniteFileBackspace()
  if strlen(getline(1)) == 0
    call feedkeys("\<Plug>(unite_delete_backward_path)")
  else
    call feedkeys("\<BS>",'n')
  endif
  return ''
endfunction


"ESCでハイライト除去
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>
