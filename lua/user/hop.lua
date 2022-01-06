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
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
