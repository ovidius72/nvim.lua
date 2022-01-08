local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

telescope.load_extension "media_files"
telescope.load_extension "fzf"

telescope.setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_config = {
      horizontal = {
        preview_height = 0.9,
        preview_width = 0.55,
        preview_cutoff = 0,
        results_width = 0.45,
        width = 0.75,
        results_height = 0.4,
        prompt_position = "bottom",
      },
      vertical = {
        mirror = false,
        preview_cutoff = 0,
        height = 0.9,
        width = 0.8,
        prompt_position = "bottom",
      },
    },
    layout_strategy = "vertical",
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        ["<C-y>"] = action_layout.toggle_preview,
        ["<C-o>"] = action_layout.cycle_layout_prev,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
        ["<C-y>"] = action_layout.toggle_preview,
        ["<C-o>"] = action_layout.cycle_layout_prev,
        ["<C-c>"] = actions.close,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  file_sorter = require("telescope.sorters").get_fzf_forter,
  generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
-- vim.api.nvim_set_keymap('n',
--   '<leader>sG',
--   [[<cmd>lua require('telescope.builtin').grep_string()<cr>]],
--   { silent = true, noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>sW",
  [[<cmd>lua require('telescope.builtin').grep_string({grep_open_files = true })<cr>]],
  { silent = true, noremap = true }
)

SearchVimFiles = function()
  require("telescope.builtin").find_files {
    prompt_title = "< Vim Files >",
    cwd = "~/.config/nvim",
  }
end

vim.api.nvim_set_keymap(
  "v",
  "<leader><leader>v",
  "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fef", "<cmd>lua SearchVimFiles()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>sg",
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For> ')})<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ss",
  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>sw",
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>')})<cr>",
  { noremap = true, silent = true }
)
-- nnoremap <leader><leader>w <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<cr>
