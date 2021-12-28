vim.cmd [[
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" map <leader>w. <plug>WinWin(1)
command! Win :call win#Win()
" map <silent><leader>w. :call win#Win(1)<cr>
" map <silent><leader>w<space> :call win#Win(1)<cr>
" map <silent><leader><leader> :call win#Win(1)<cr>
map <silent><leader>; :Win<cr>
map <silent><leader>. :call win#Win(1)<cr>
map <leader>w; <plug>WinWin

let g:win_resize_height = 3
let g:win_resize_width = 4
let g:win_disable_version_warning = 0
let g:win_ext_command_map = {
      \   'c': 'wincmd c',
      \   'C': 'close!',
      \   'q': 'quit',
      \   'Q': 'quit!',
      \   '!': 'qall!',
      \   'V': 'wincmd v',
      \   'S': 'wincmd s',
      \   'n': 'bnext',
      \   'N': 'bnext!',
      \   'p': 'bprevious',
      \   'P': 'bprevious!',
      \   "\<c-n>": 'tabnext',
      \   "\<c-p>": 'tabprevious',
      \   '=': 'wincmd =',
      \   't': 'tabnew',
      \   ',': 'Win#exit'
      \ }

highlight link WinActive WildMenu 
" highlight WinInactive term=bold ctermfg=12 ctermbg=159 guibg=LingCyan
highlight link WinInactive WhiteSpace
]]
