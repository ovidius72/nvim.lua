local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end
hop.setup {
  case_insensitive = false,
  keys = 'etovxqpdygfblzhckisuran',
  multi_windows = true,

}
vim.api.nvim_set_keymap("n", "<leader>j1", ":HopChar1<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j2", ":HopChar2<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jl", ":HopLine<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jw", ":HopWord<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":HopWord<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', '<C-p>', "<cmd>lua require'hop'.hint_char1({ current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>jj", ":HopWordAC<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jk", ":HopWordBC<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>jp", ":HopPattern<cr>", { silent = true, noremap = true })
--[[ -- operations ]]
-- line
vim.api.nvim_set_keymap('o', 'l', "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = true, inclusive_jump = false })<cr>", {})
-- char
vim.api.nvim_set_keymap('o', 'o', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', 'O', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'u', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('o', 'U', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})

--[[ -- visual ]]
-- line
vim.api.nvim_set_keymap('v', 'l', "<cmd>lua require'hop'.hint_char1({ direction = nil, current_line_only = true, inclusive_jump = false })<cr>", {})
-- char
vim.api.nvim_set_keymap('v', 'o', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', 'O', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('v', 'u', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = false })<cr>", {})
vim.api.nvim_set_keymap('v', 'U', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})

