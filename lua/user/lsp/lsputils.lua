local border_chars = {
  TOP_LEFT = "┌",
  TOP_RIGHT = "┐",
  MID_HORIZONTAL = "─",
  MID_VERTICAL = "│",
  BOTTOM_LEFT = "└",
  BOTTOM_RIGHT = "┘",
}
vim.g.lsp_utils_codeaction_opts = {
  height = 4,
	preview = {
		border = true,
		numbering = false,
		highlight = "PmenuSbar"
	},
  border = true,
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k",
    },
  },
}
vim.g.lsp_utils_location_opts = {
  height = 34,
  mode = "editor",
  border_chars = border_chars,
  list = {
    border = true,
    numbering = true,
  },
  preview = {
    title = "Location Preview",
    border = true,
    border_chars = border_chars,
  },
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k",
    },
  },
}

vim.g.lsp_utils_symbols_opts = {
  height = 24,
  mode = "editor",
  list = {
    border = true,
    numbering = false,
  },
  preview = {
    title = "Symbols Preview",
    border = true,
    border_chars = border_chars,
  },
  prompt = {},
}
