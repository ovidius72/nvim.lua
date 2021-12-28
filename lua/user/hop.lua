local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end
hop.setup {
  case_insensitive = false,
  keys = 'etovxqpdygfblzhckisuran'
}
vim.api.nvim_set_keymap("n", "<leader>j1", ":HopChar1<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j2", ":HopChar2<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jl", ":HopLine<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jw", ":HopWord<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":HopWord<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jj", ":HopWordAC<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jk", ":HopWordBC<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jp", ":HopPattern<cr>", { silent = true, noremap = true })
