local catppuccin = require "catppuccin"

-- configure it
catppuccin.setup {
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = "italic",
    functions = "italic",
    keywords = "italic",
    strings = "NONE",
    variables = "bold",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    lsp_saga = false,
    gitgutter = true,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = false,
    lightspeed = false,
    ts_rainbow = false,
    hop = true,
    cmp = true,
  },
}

----------------------------------------------------------------------
--                            Rose Pine                             --
----------------------------------------------------------------------

-- Set variant
-- Defaults to 'dawn' if vim background is light
-- @usage 'base' | 'moon' | 'dawn' | 'rose-pine[-moon][-dawn]'
vim.g.rose_pine_variant = "moon"
-- Disable italics
vim.g.rose_pine_disable_italics = false
-- Use terminal background
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_bold_vertical_split_line = true
vim.g.rose_pine_inactive_background = false
function ChangeRosePineTheme()
  require('rose-pine').toggle()
  -- ReloadLualine()
  -- setTransapentBackground()
end

function SetRosePineVariant(variant)
  require('rose-pine').set(variant)
  -- ReloadLualine()
end
vim.api.nvim_set_keymap('n', '<leader>t1', [[<cmd>lua SetRosePineVariant('dawn')<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t2', [[<cmd>lua SetRosePineVariant('moon')<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t3', [[<cmd>lua SetRosePineVariant('base')<cr>]], { noremap = true, silent = true })

vim.cmd [[
try
  colorscheme rose-pine
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- vim.cmd [[
--   hi Pmenu guibg=#121212 ctermbg=237
--   hi PmenuSel guibg=#505050 ctermbg=60
--   hi PmenuSbar guibg=#727272 ctermbg=60
--   hi PmenuThumb guibg=#424865 ctermbg=60
-- ]]
