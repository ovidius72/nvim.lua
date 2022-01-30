local lspconfig = require "lspconfig"
local M = {}

M.setup_lsp_ts = function()
  local options = require("nvim-lsp-ts-utils").init_options
  if not options or next(options) == nil then
    options = { plugins = {} }
  end

  if not options.plugins or next(options.plugins) == nil then
    options.plugins = {}
  end
  -- get the global node_modules path
  local handle = io.popen "npm get prefix"
  local path = handle:read "*a"
  if path then
    local nodePath = path:gsub("\n[^\n]*(\n?)$", "%1")
    nodePath = nodePath .. '/lib/node_modules/typescript-styled-plugin'
    table.insert(options.plugins, {
      name = "typescript-styled-plugin",
      location = nodePath
    })
  end
  lspconfig.tsserver.setup {
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    init_options = options,
    on_attach = function(client, bufnr)
      local ts_utils = require "nvim-lsp-ts-utils"
      -- defaults
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,

        -- import all
        import_all_timeout = 1000, -- ms
        -- lower numbers = higher priority
        import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = { 80001, 6133 },

        -- inlay hints
        auto_inlay_hints = false,
        inlay_hints_highlight = "Comment",
        inlay_hints_priority = 200, -- priority of the hint extmarks
        inlay_hints_throttle = 150, -- throttle the inlay hint request
        inlay_hints_format = { -- format options for individual hint kind
          Type = {},
          Parameter = {},
          Enum = {},
          Interface = {},
          -- Example format customization for `Type` kind:
          -- Type = {
          --     highlight = "Comment",
          --     text = function(text)
          --         return "->" .. text:sub(2)
          --     end,
          -- },
        },

        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,
      }

      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      client.resolved_capabilities.document_diagnostic = false
      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gS", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TSLspImportAll<CR>", opts)
    end,
  }
end

return M
