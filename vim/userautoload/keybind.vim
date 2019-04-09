"EXモードを使わない
nnoremap Q <nop>

"shift+k無効
nnoremap K <nop>

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
  inoremap <buffer><expr> <C-p> CmdwinPrevious()
  inoremap <buffer><expr> <C-n> CmdwinNext()
  normal j
  startinsert!
endfunction

"q:,q/,q?でコマンドラインウィンドウを開かないようにする(標準入力の場合を除く)
autocmd vimenter * nested if @% == '' && s:GetBufByte() == 0 | call s:disable_cmdwin_from_q() | endif

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

"EXモードを使わない
nnoremap Q <nop>

"shift+k無効
nnoremap K <nop>

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

"ESCでハイライト除去
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR><ESC>

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
nnoremap <Space>H <C-W>H
nnoremap <Space>J <C-W>J
nnoremap <Space>K <C-W>K
nnoremap <Space>L <C-W>L

"terminalモード
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

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

"バッファ文字数を数える関数
function! s:GetBufByte()
  let byte = line2byte(line('$') + 1)
  if byte == -1
    return 0
  else
    return byte - 1
  endif
endfunction
