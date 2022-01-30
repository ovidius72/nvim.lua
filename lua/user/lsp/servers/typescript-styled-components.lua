local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
-- Check if it's already defined for when reloading this file.
if not configs.ts_styled_components then
  configs.ts_styled_components = {
    default_config = {
      -- cmd = { "typescript-styled-plugin" },
      -- filetypes = { "typescriptreact, javascriptreact" },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end,
      settings = {},
    },
  }
end
local custom_attach = function(client)
  print "Typescript Styled Component LSP started."
end
lspconfig.ts_styled_components.setup { on_attach = custom_attach }

-- Set filetype to deluge

-- vim.cmd [[ au BufNewFile,BufRead /*.tsx setf deluge ]]
