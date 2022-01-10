local cmp_status_ok, cmp = pcall(require, "cmp")
local types = require "cmp.types"

if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
--   project
--   bug
--   dashboard
--   history
--   comment
--   code
--   git add
--   git mod
--   git remove
--   git ignore
--   git rename
--   error
--   info
--   question
--   warning
--   lightbulb
--   diff
--   file
--   files
--   folder
--   open folder
--  circle
--   big circle
--   big unfilled
--  close
--   lock
--   new file
--   search
--   array
--   number
--   symbol misc
--   telescope

--   פּ ﯟ   蘒練 some other good icons
local kind_icons = {
  Text = "",
  -- Method = "m",
  Method = "",
  -- Function = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

-- local kind_icons = {
--   Text = " ",
--   Method = " ",
--   Function = " ",
--   Constructor = " ",
--   Field = " ",
--   Variable = " ",
--   Class = " ",
--   Interface = " ",
--   Module = " ",
--   Property = " ",
--   Unit = " ",
--   Value = " ",
--   Enum = " ",
--   Keyword = " ",
--   Snippet = " ",
--   Color = " ",
--   File = " ",
--   Reference = " ",
--   Folder = " ",
--   EnumMember = " ",
--   Constant = " ",
--   Struct = " ",
--   Event = " ",
--   Operator = " ",
--   TypeParameter = " ",
-- }
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- sorting = {
  --   comparators = {
  --     cmp.config.compare.score,
  --     -- function(entry1, entry2)
  --     --   local kind1 = entry1:get_kind()
  --     --   kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
  --     --   local kind2 = entry2:get_kind()
  --     --   kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
  --     --   if kind1 ~= kind2 then
  --     --     if kind1 == types.lsp.CompletionItemKind.Snippet then
  --     --       return false
  --     --     end
  --     --     if kind2 == types.lsp.CompletionItemKind.Snippet then
  --     --       return true
  --     --     end
  --     --     local diff = kind1 - kind2
  --     --     if diff < 0 then
  --     --       return true
  --     --     elseif diff > 0 then
  --     --       return false
  --     --     end
  --     --   end
  --     -- end,
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-f>"] = cmp.mapping.confirm { select = true },
    -- ["<C-l>"] = cmp.mapping.confirm { select = true },
    ["<C-l>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.confirm()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  -- VSCode style
  -- formatting = {
  --   format = function(_, vim_item)
  --     vim_item.kind = (kind_icons[vim_item.kind] .. ' ' or '') .. vim_item.kind
  --     return vim_item
  --   end,
  -- },
  -- minimal VSCode style
  -- formatting = {
  --   fields = { "kind", "abbr" },
  --   format = function(_, vim_item)
  --     vim_item.kind = kind_icons[vim_item.kind] or ""
  --     return vim_item
  --   end,
  -- },
  formatting = {
    fields = { "kind", "menu", "abbr" },
    format = function(entry, vim_item)
      -- Kind icons
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        path = "[Path]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        emoji = "[Emoji]",
        -- nvim_lsp = "",
        -- nvim_lua = "",
        -- luasnip = "",
        -- buffer = "",
        -- path = "",
        -- emoji = "",
      })[entry.source.name]

      local kind = vim_item.kind
      local abbr = vim_item.abbr
      local menu = vim_item.menu

      vim_item.kind = string.format("%s %s ", kind_icons[vim_item.kind], abbr) -- This concatonates the icons with the name of the item kind
      vim_item.abbr = string.format(" %05s%10s ", menu, kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = "" -- string.format("%-50s", menu) -- This concatonates the icons with the name of the item kind

      -- NOTE: order matters
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp", priority = 6 },
    { name = "path", priority = 6, max_item_count = 3 },
    { name = "luasnip", priority = 5, max_item_count = 3 },
    {
      name = "buffer",
      option = {
        priority = 4,
        max_item_count = 5,
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = "nvim_lua", priority = 3 },
    { name = "path", priority = 2 },
    { name = "emoji", priority = 1 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  cmp.setup.cmdline("/", {
    sources = { name = "buffer" },
  }),
}

-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })
vim.cmd [[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]]
