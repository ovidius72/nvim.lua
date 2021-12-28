vim.cmd [[
let g:sandwich_no_default_key_mappings = 1
silent! nmap <unique><silent><leader>vsd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent><leader>vsr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent><leader>vsdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent><leader>vsrb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

let g:operator_sandwich_no_default_key_mappings = 1
" add
silent! map <unique><leader>vsa <Plug>(operator-sandwich-add)
" delete
silent! xmap <unique><leader>vsd <Plug>(operator-sandwich-delete)
" replace
silent! xmap <unique><leader>vsr <Plug>(operator-sandwich-replace)
]]
