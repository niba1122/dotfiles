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
nnoremap <silent> [unite]r :<C-U>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]m :<C-U>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]g :<C-U>Unite<Space>grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]gr :<C-U>UniteResume search-buffer<CR>

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

  imap <buffer><expr> <BS> UniteFileBackspace()

  imap <buffer> <C-h> <BS>

endfunction

function! UniteFileBackspace()
  if strlen(getline(1)) == 0
    call feedkeys("\<Plug>(unite_delete_backward_path)")
  else
    call feedkeys("\<BS>",'n')
  endif
  return ''
endfunction

