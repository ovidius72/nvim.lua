require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "bold",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    -- modules = {             -- List of various plugins and additional options
    --   -- ...
    -- },
  }
})

require("onedark").setup {
  style = "deep",
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  -- toggle theme style ---
  toggle_style_key = "<leader>ts", -- Default keybinding to toggle
  toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "italic",
    strings = "none",
    variables = "bold",
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}

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
    lsp_saga = true,
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
    neogit = true,
    vim_sneak = false,
    fern = true,
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
vim.g.disable_italics = false
-- Use terminal background
vim.g.bold_vert_split = true
vim.g.dim_nc_background = false
vim.g.disable_background = false
function ChangeRosePineTheme()
  require("rose-pine").toggle()
  -- ReloadLualine()
  -- setTransapentBackground()
end

function SetRosePineVariant(variant)
  require("rose-pine").set(variant)
  -- ReloadLualine()
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>t1",
  [[<cmd>lua SetRosePineVariant('dawn')<cr>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>t2",
  [[<cmd>lua SetRosePineVariant('moon')<cr>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>t3",
  [[<cmd>lua SetRosePineVariant('base')<cr>]],
  { noremap = true, silent = true }
)

require("kanagawa").setup { globalStatus = true, ... }

vim.opt.laststatus = 3
vim.opt.fillchars:append {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┨",
  vertright = "┣",
  verthoriz = "╋",
}

vim.cmd [[
try
  colorscheme duskfox
  set laststatus=3
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
