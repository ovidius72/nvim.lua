local C = {
  fg = "#D4D4D4",
  bg = "#1E1E1E",
  alt_bg = "#252525",
  dark = "#222222",
  accent = "#BBBBBB",
  popup_back = "#2D2D30",
  search_orange = "#613214",
  search_blue = "#5e81ac",
  white = "#D8DEE9",
  gray = "#808080",
  dark_gray = "#3e3e3e",
  context = "#606060",
  light_gray = "#cccccc",
  tree_gray = "#252526",
  blue = "#569CD6",
  vivid_blue = "#4FC1FF",
  dark_blue = "#223E55",
  folder_blue = "#42A5F5",
  light_blue = "#9CDCFE",
  green = "#6A9955",
  cyan = "#4EC9B0",
  light_green = "#B5CEA8",
  red = "#F44747",
  orange = "#CE9178",
  light_red = "#D16969",
  yellow = "#DCDCAA",
  yellow_orange = "#D7BA7D",
  purple = "#C586C0",
  magenta = "#D16D9E",
  cursor_fg = "#515052",
  cursor_bg = "#AEAFAD",
  sign_add = "#587c0c",
  sign_change = "#0c7d9d",
  sign_delete = "#94151b",
  tree_sign_add = "#73C991",
  tree_sign_change = "#CCA700",
  error_red = "#F44747",
  warning_orange = "#ff8800",
  info_yellow = "#FFCC66",
  hint_blue = "#4FC1FF",
  success_green = "#14C50B",
  purple_test = "#ff007c",
  cyan_test = "#00dfff",
  ui_blue = "#264F78",
  ui2_blue = "#042E48",
  ui3_blue = "#0195F7",
  ui4_blue = "#75BEFF",
  ui_orange = "#E8AB53",
  ui_purple = "#B180D7",
}

local Cmp = {
  CmpItemAbbrDeprecated = { fg = C.gray, style = "strikethrough" },
  CmpItemAbbrMatch = { fg = C.ui3_blue },
  CmpItemAbbrMatchFuzzy = { fg = C.ui3_blue },
  CmpItemKindFunction = { fg = C.ui_purple },
  CmpItemKindMethod = { fg = C.ui_purple },
  CmpItemKindConstructor = { fg = C.ui_orange },
  CmpItemKindClass = { fg = C.ui_orange },
  CmpItemKindEnum = { fg = C.ui_orange },
  CmpItemKindEvent = { fg = C.ui_purple },
  CmpItemKindInterface = { fg = C.light_blue },
  CmpItemKindStruct = { fg = C.ui4_blue },
  CmpItemKindVariable = { fg = C.ui4_blue },
  CmpItemKindField = { fg = C.ui4_blue },
  CmpItemKindProperty = { fg = C.ui4_blue },
  CmpItemKindEnumMember = { fg = C.light_blue },
  CmpItemKindConstant = { fg = C.ui4_blue },
  CmpItemKindKeyword = { fg = C.fg },
  CmpItemKindModule = { fg = C.fg },
  CmpItemKindValue = { fg = C.fg },
  CmpItemKindUnit = { fg = C.fg },
  CmpItemKindText = { fg = C.fg },
  CmpItemKindSnippet = { fg = C.fg },
  CmpItemKindFile = { fg = C.fg },
  CmpItemKindFolder = { fg = C.fg },
  CmpItemKindColor = { fg = C.fg },
  CmpItemKindReference = { fg = C.fg },
  CmpItemKindOperator = { fg = C.fg },
  CmpItemKindTypeParameter = { fg = C.fg },
}

local function highlight(group, properties)
  local bg = properties.bg == nil and "" or "guibg=" .. properties.bg
  local fg = properties.fg == nil and "" or "guifg=" .. properties.fg
  local style = properties.style == nil and "" or "gui=" .. properties.style

  local cmd = table.concat({
    "highlight",
    group,
    bg,
    fg,
    style,
  }, " ")

  vim.api.nvim_command(cmd)
end

for group, properties in pairs(Cmp) do
  highlight(group, properties)
end

function SetCmpColors()
  for group, properties in pairs(Cmp) do
    highlight(group, properties)
  end
end

vim.cmd [[
  augroup MyColors
    autocmd!
    autocmd ColorScheme * lua SetCmpColors()  
  augroup END
]]
