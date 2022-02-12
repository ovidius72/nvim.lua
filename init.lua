require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.move"
require "user.fzf-vim"
require "user.vim-legacy"
require "user.iswap-config"
require "user.scrollbar-config"
require "user.hlslens-config"
-- require "user.tmux"
require "user.vgit-config"
require "user.package-info-config"
require "user.rnvimr"
require "user.mini-config"
-- require "user.diffview"
require "user.fern"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
-- require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.quickscope"
require "user.hop"
require "user.matchup"
require "user.numb"
require "user.dial"
require "user.colorizer"
require "user.spectre"
require "user.zen-mode"
require "user.neoscroll"
require "user.todo-comments"
require "user.bookmark"
require "user.renamer"
-- require "user.symbol-outline"
-- require "user.git-blame"
require "user.git_messenger"
require "user.gist"
require "user.gitlinker"
require "user.session-manager"
require "user.surround"
require "user.notify"
require "user.ts-context"
require "user.registers"
require "user.gps"
require "user.wilder"
require "user.vim-win"
require "user.sandwich"
require "user.vim-test"
require "user.undotree"
require "user.lazygit"
require "user.neogit"
vim.cmd [[
  omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
  vnoremap <silent> m :lua require('tsht').nodes()<CR>
]]

-- require("fidget").setup {
--   text = {
--     spinner = "dots",
--   },
-- }
-- require("luasnip.loaders.from_vscode").load { paths = { "./snippets/json" } }
require("luasnip.loaders.from_snipmate").load()

require('nvim_context_vt').setup({
  -- -- Override default virtual text prefix
  -- -- Default: '-->'
  -- prefix = '',
  --
  -- -- Override the internal highlight group name
  -- -- Default: 'ContextVt'
  highlight = 'BufferlineDevIconDefault',
  --
  -- -- Disable virtual text for given filetypes
  -- -- Default: {}
  -- disable_ft = { 'markdown' },
  --
  -- -- Disable display of virtual text below blocks for indentation based languages like Python
  -- -- Default: false
  -- disable_virtual_lines = false,
  --
  -- -- Same as above but only for spesific filetypes
  -- -- Default: {}
  -- disable_virtual_lines_ft = { 'yaml' },
  --
  -- -- How many lines required after starting position to show virtual text
  -- -- Default: 1 (equals two lines total)
  -- min_rows = 1,
  --
  -- -- Custom virtual text node parser callback
  -- -- Default: nil
  -- custom_parser = function(node, ft, opts)
  --   local ts_utils = require('nvim-treesitter.ts_utils')
  --
  --   -- If you return `nil`, no virtual text will be displayed.
  --   if node:type() == 'function' then
  --     return nil
  --   end
  --
  --   -- This is the standard text
  --   return '--> ' .. ts_utils.get_node_text(node)[1]
  -- end,
  --
  -- -- Custom node validator callback
  -- -- Default: nil
  -- custom_validator = function(node, ft, opts)
  --   -- Internally a node is matched against min_rows and configured targets
  --   local default_validator = require('nvim_context_vt.utils').default_validator
  --   if default_validator(node, ft) then
  --     -- Custom behaviour after using the internal validator
  --     if node:type() == 'function' then
  --       return false
  --     end
  --   end
  --
  --   return true
  -- end,
  --
  -- -- Custom node virtual text resolver callback
  -- -- Default: nil
  -- custom_resolver = function(nodes, ft, opts)
  --   -- By default the last node is used
  --   return nodes[#nodes]
  -- end,
})
