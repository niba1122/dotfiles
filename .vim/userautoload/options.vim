"デザイン&カラースキーム
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
"set clipboard=autoselect,unnamed

"ノーマルモードのxでレジスタに保存しない
nnoremap x "_x

"コマンドラインモードでのタブキーでの補完
set wildmenu

"UTF-8
set encoding=UTF-8

"空白/タブなどを表示
set list
set lcs=tab:>-,extends:\

"バックアップ/スワップを無効
set nobackup
set noswapfile

highlight WhitespaceEOL ctermbg=blue guibg=blue
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/



"vue.js component
autocmd BufNewFile,BufRead *.vue setlocal filetype=html
