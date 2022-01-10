require("hlslens").setup {
  calm_down = true,
  nearest_only = true,
  nearest_float_when = "always",
  build_position_cb = function(plist)
    require("scrollbar.handlers.search").handler.show(plist.start_pos)
  end,
}

vim.cmd [[
  augroup scrollbar_search_hide
  autocmd!
  autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
  augroup END

  noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
  \<Cmd>lua require('hlslens').start()<CR>
  noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
  \<Cmd>lua require('hlslens').start()<CR>
  noremap * *<Cmd>lua require('hlslens').start()<CR>
  noremap # #<Cmd>lua require('hlslens').start()<CR>
  noremap g* g*<Cmd>lua require('hlslens').start()<CR>
  noremap g# g#<Cmd>lua require('hlslens').start()<CR>
]]
