require("tmux").setup {
  -- overwrite default configuration
  -- here, e.g. to enable default bindings
  copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
    enable = true,
  },
  navigation = {
    -- enables default keybindings (C-hjkl) for normal mode
    enable_default_keybindings = false,
  },
  resize = {
    -- enables default keybindings (A-hjkl) for normal mode
    enable_default_keybindings = false,
  },
}
local map = vim.api.nvim_set_keymap
local map_opts = {noremap = true, silent = true}
map("n", "<C-h>", ":lua require'tmux'.move_left()<cr>", map_opts)
map("n", "<C-j>", ":lua require'tmux'.move_bottom()<cr>", map_opts)
map("n", "<C-k>", ":lua require'tmux'.move_top()<cr>", map_opts)
map("n", "<C-l>", ":lua require'tmux'.move_right()<cr>", map_opts)
