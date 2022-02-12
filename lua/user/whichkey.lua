local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 30 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- local m_opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "m",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local m_mappings = {
--   a = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
--   c = { "<cmd>BookmarkClear<CR>", "Clear" },
--   m = { "<cmd>BookmarkToggle<CR>", "Toggle" },
--   h = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Harpoon" },
--   j = { "<cmd>BookmarkNext<CR>", "Next" },
--   k = { "<cmd>BookmarkPrev<CR>", "Prev" },
--   s = {
--     "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<CR>",
--     "Show",
--   },
--   x = { "<cmd>BookmarkClearAll<CR>", "Clear All" },
--   u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon UI" },
-- }

local mappings = {
  ["<tab>"] = { "Prev Buffer" },
  ["i"] = { "<cmd>:Files<CR>", "Find File" },
  ["l"] = { "<cmd>:Buffers<CR>", "Open Buffers" },
  ["["] = { "<cmd>:Fern . -drawer -toggle -width=35<CR>", "Open Explorer" },
  ["]"] = { "<cmd>:Fern . -drawer -reveal=% -width=35<CR>", "Focus Explorer" },
  ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
  -- ["["] = { "<cmd>NvimTreeToggle<CR>", "Open Explorer" },
  -- ["]"] = { "<cmd>NvimTreeFindFile<CR>", "Explorer" },
  -- ["P"] = { "<cmd>Telescope projects<CR>", "Projects" },
  -- ["R"] = { '<cmd>lua require("renamer").rename()<CR>', "Projects" },
  ["z"] = { "<cmd>ZenMode<CR>", "Zen" },

  ["<space>"] = {
    name = "Telescope",
    s = { "<cmd>Telescope live_grep default_text=<c-r>0<CR>", "Live Grep" },
    f = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Git Files" },
    F = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "All Files" },
    S = { "<cmd>Telescope grep_string<CR>", "Grep String" },
    b = { "<cmd>Telescope builtin<CR>", "Builtins" },
    B = { "<cmd>Telescope file_browser<CR>", "File Browser" },
    r = { "<cmd>Telescope registers<CR>", "Register" },
    l = { "<cmd>Telescope spell_suggest<CR>", "Spell Suggest" },
    j = { "<cmd>Telescope jumplist<CR>", "Jumplist" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
  },

  a = {
    name = "apps",
    z = { "<cmd>ZenMode<CR>", "ZenMode" },
    t = {
      name = "Test",
      n = { "Nearest" },
    },
    u = {
      name = "Undo",
      m = "Mundo toggle",
      M = "Mundo Focus",
      t = "Undotree Toggle",
      T = "Undotree Focus",
    },
  },

  b = {
    name = "Buffer",
    k = { "<cmd>Bdelete!<CR>", "Close" },
    e = { "Source Buffer" },
  },

  c = {
    name = "Code",
    -- a = { "<cmd>lua require'lspactions'.code_action()<CR>", "Code Action" },
    o = { "<cmd>lua require'lspactions'.code_action()<CR>", "Code Action" },
    -- o = { "<cmd>lua require'lspactions'.range_code_action()<CR>", "Range Code Action" },
    u = { "<cmd>TroubleToggle<CR>", "Diagnostics" },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<CR>",
      "Workspace Diagnostics",
    },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
    l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    n = { "<cmd>SymbolsOutline<CR>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    j = { "<cmd>TroubleToggle lsp_references<CR>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      "Workspace Symbols",
    },
    t = {
      name = "Todo",
      q = { "<cmd>TodoQuickFix<CR>", "Todo QuickFix" },
      l = { "<cmd>TodoLocList<CR>", "Todo LocList" },
      r = { "<cmd>TodoTrouble<CR>", "Todo Trouble" },
      t = { "<cmd>TodoTelescope<CR>", "Todo Telescope" },
    },
  },

  f = {
    name = "Files",
    p = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
      "Pick File",
    },
    s = { "<cmd>wa!<CR>", "Save All" },
    f = { "<cmd>:Files<CR>", "Find File" },
    o = { "<cmd>:GFiles<CR>", "Git Files" },
    g = { "<cmd>:GFiles?<CR>", "Git Changed Files" },
    F = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
      "Find files",
    },
    r = { "<cmd>:History<CR>", "Old files" },
    S = { "<cmd>w!<CR>", "Save Buffer" },
    -- w = { "Find Word Under Cursor" },
    e = {
      name = "Neovim",
      f = { "<cmd>:NeovimConfigFiles<CR>", "Config files" },
      r = { "Reload" },
    },
  },

  g = {
    name = "Git",
    g = { "<cmd>LazyGit<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    M = { "<cmd>lua require 'git_blame'.run()<CR>", "Blame Lines" },
    m = { "Blame Popup" },
    h = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
    B = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>:Commits<CR>", "Git Commits" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<CR>",
      "Diff",
    },
  },

  j = {
    name = "Jump",
    ["1"] = { "HopChar1" },
    ["2"] = { "HopChar2" },
    l = { "HopLine" },
    w = { "HopWord" },
    j = { "HopWordAC" },
    k = { "HopWordBC" },
    p = { "HopPattern" },
  },

  o = {
    name = "Other",
    f = { "<cmd>Format<CR>", "Format Buffer" },
    O = { "<cmd>lua OrganizeImports()<CR>", "OrganizeImports" },
    o = { "<cmd>lua OrganizeImportsAndFormat()<CR>", "OrganizeImportsAndFormat" },
    p = { "Language Print/Log" },
    l = { "Console.log" },
    k = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Buffer Symbols" },
    s = { "<cmd>:ISwap<CR>", "ISwap" },
    w = { "<cmd>:ISwapWith<CR>", "ISwapWith" },
  },

  p = {
    name = "Packages",
    P = {
      name = "Paker",
      c = { "<cmd>PackerCompile<CR>", "Compile" },
      i = { "<cmd>PackerInstall<CR>", "Install" },
      s = { "<cmd>PackerSync<CR>", "Sync" },
      S = { "<cmd>PackerStatus<CR>", "Status" },
      u = { "<cmd>PackerUpdate<CR>", "Update" },
    },
    i = {
      name = "Package Json Info",
      s = { " Show " },
      h = { " Hide " },
      u = { " Update " },
      d = { " Delete " },
      i = { " Install " },
      r = { " Reinstall " },
      v = { " Change Version " },
    },
  },

  r = {
    name = "Replace",
    r = { "<cmd>lua require('spectre').open()<CR>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Replace Word" },
    f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Replace Buffer" },
  },


  s = {
    name = "Search",
    a = { "<cmd>:AGP<CR>", "AGP" },
    A = { "<cmd>:Ag!<CR>", "AG Full" },
    C = { "<cmd>Telescope commands<CR>", "Commands" },
    l = { "<cmd>:Lines<CR>", "Search Lines" },
    f = { "<cmd>:RG<CR>", "RG Fuzzy" },
    F = { "<cmd>:RG!<CR>", "RG Fuzzy Full" },
    g = { "<cmd>:GGrep<CR>", "GGrep" },
    h = { "<cmd>:History/<CR>", "Search History" },
    c = { "<cmd>:History:<CR>", "Command History" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    w = { "<cmd>:Find<CR>", "Find At Cursor" },
    W = { "Find At Cursor(Open Files)" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    m = { "<cmd>:Marks<CR>", "Marks" },
    j = { "<cmd>Telescope jumplist<CR>", "Jumplist" },
    r = { "<cmd>:Rg<CR>", "RG" },
    R = { "<cmd>:Rg!<CR>", "RG Full" },
    s = { "<cmd>:BLines<CR>", "Search Buffer Lines" },
    t = { "<cmd>:BTags<CR>", "Buffer Tags" },
  },

  S = {
    name = "Session",
    s = { "<cmd>SaveSession<CR>", "Save" },
    l = { "<cmd>LoadLastSession!<CR>", "Load Last" },
    d = { "<cmd>LoadCurrentDirSession!<CR>", "Load Last Dir" },
    f = { "<cmd>Telescope sessions save_current=false<CR>", "Find Session" },
  },

  t = {
    name = "Toggle",
    ["1"] = { "RosePine Dawn" },
    ["2"] = { "RosePine Moon" },
    ["3"] = { "RosePine Base" },
    f = { "<cmd>ToggleTerm direction=float<CR>", "Term Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Term H" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Term V" },
    t = { "<cmd>TroubleToggle<CR>", "Trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "References" },
    H = { "<cmd>set hlsearch!<CR>", "hlsearch" },
    s = { "<cmd>set spell!<CR>", "Spell" },
  },

  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<CR>", "Playground" },
  },

  u = {
    name = "Tests",
    n = { "Nearest" },
    f = { "File" },
    s = { "Suite" },
    l = { "Last" },
    v = { "Visit" },
    o = { "Summary" },
    u = { "Ultest" },
    j = { "Jump Output" },
    N = { "Nearest Ultest" },
    F = { "Nearest File" },
    ["["] = { "Prev Failed" },
    ["]"] = { "Next Failed" },
  },
  v = {
    name = "Select",
    s = {
      name = "Sandwich",
      a = { "Add Motion... " },
     d = { "Delete Motion... " },
      r = { "Replace Motion... " },
    },
  },

  w = {
    name = "Windows",
    d = { "<cmd>q<CR>", "Close Window" },
    v = { "<cmd>vs<CR>", "Split Vertical" },
    s = { "<cmd>sp<CR>", "Split Horizontal" },
  },

}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
  ["<space>"] = {
    name = "Telescope",
    v = { "Live Grep" },
  },
  v = {
    name = "Select",
    s = {
      name = "Sandwich",
      a = { "Add... " },
      d = { "Delete... " },
      r = { "Replace... " },
    },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
-- which_key.register(m_mappings, m_opts)
