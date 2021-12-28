vim.cmd [[
set undofile
set undodir=~/.vim/uno
nnoremap <silent><leader>aum :MundoToggle<CR>: UndotreeFocus<CR>
nnoremap <silent><leader>auM :MundoShow <CR>: UndotreeFocus<CR>
nnoremap <silent><leader>aut :UndotreeToggle<CR>
nnoremap <silent><leader>auT :UndotreeFocus<CR>
]]
