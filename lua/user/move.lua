vim.cmd [[
  let g:move_map_keys=0
  vmap <M-j>  <Plug>MoveBlockDown
  vmap <M-k> <Plug>MoveBlockUp
  vmap <M-h> <Plug>MoveBlockLeft
  vmap <M-l> <Plug>MoveBlockRight

  nmap <M-j> <Plug>MoveLineDown
  nmap <M-k> <Plug>MoveLineUp
  nmap <M-h> <Plug>MoveCharLeft
  nmap <M-l> <Plug>MoveCharRight

  " MAC
  "<M-j>
  nmap ∆ <Plug>MoveLineDown 
  vmap ∆ <Plug>MoveBlockDown 
  "<M-k>
  nmap ˚ <Plug>MoveLineUp
  vmap ˚ <Plug>MoveBlockUp
  "<M-h>
  nmap ˙ <Plug>MoveCharLeft
  vmap ˙ <Plug>MoveBlockLeft
  "<M-l>
  nmap ¬ <Plug>MoveCharRight
  vmap ¬ <Plug>MoveBlockRight
]]
