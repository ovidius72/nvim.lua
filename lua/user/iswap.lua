require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'qwertyuiop',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'enabled',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  -- hl_snipe = 'ErrorMsg',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  -- hl_selection = 'WarningMsg',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'LineNr',

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true
}

-- vim.api.nvim_set_keymap("n", "<leader>os", "<cmd>ISwap<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>ow", "<cmd>ISwapWith<CR>", {noremap=true})
