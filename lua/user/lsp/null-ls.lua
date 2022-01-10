local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = {
    formatting.prettier.with {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "solidity",
      },
    },
    -- formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    diagnostics.write_good,
    code_actions.eslint,
    -- formatting.phpcsfixer,
    -- formatting.stylelint,
    diagnostics.jsonlint,
    diagnostics.codespell,
    formatting.codespell,
    -- formatting.eslint_d,
    -- codeAction.gitsigns,
  },
}
