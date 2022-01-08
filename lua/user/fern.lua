
vim.cmd [[
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden = 1
" map <leader>[ :Fern . -drawer -toggle -width=35<CR>
" map <leader>] :Fern . -drawer -reveal=% -width=35<CR>

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> <C-l> <C-w>l
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> I <Plug>(fern-action-hidden:toggle)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> r <Plug>(fern-action-move)
  nmap <buffer> gY <Plug>(fern-action-yank)
  nmap <buffer><nowait> <leader>] <C-w><C-p>
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-i> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
  nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
endfunction

augroup fern-custom
  autocmd! *
  autocmd fileType fern setlocal nonumber norelativenumber
  autocmd FileType fern call s:init_fern()
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]]
