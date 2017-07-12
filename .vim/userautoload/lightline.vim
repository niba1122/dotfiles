set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'component': { 'readonly': '%{&readonly?"\ue0a2":""}' },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'mode': 'LightLineMode'
      \ },
      \ }

function! LightLineFilename()
  let fname = substitute(expand('%:p'), '^'.expand('~'), '~', 'g')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? substitute(unite#get_status_string(), '\%(\[.*\)\@<='.expand('~'), '~', 'g') :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0

set background=dark
colorscheme jellybeans
"let g:jellybeans_overrides = {
"\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
"\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
"\              'attr': 'bold' },
"\}
"let g:jellybeans_use_lowcolor_black = 0
let g:jellybeans_background_color_256='NONE'

