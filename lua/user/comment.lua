local keymap = vim.keymap.set
local status_ok, comment = pcall(require, "Comment")

if status_ok then
  comment.setup {
    pre_hook = function(ctx)
      local U = require "Comment.utils"

      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring {
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        location = location,
      }
    end,
  }
end

local cb_ok, cb = pcall(require, "comment-box")
if cb_ok then
  cb.setup {
    -- doc_width = 80, -- width of the document
    -- box_width = 60, -- width of the boxes
    -- borders = { -- symbols used to draw a box
    --   top = "─",
    --   bottom = "─",
    --   left = "│",
    --   right = "│",
    --   top_left = "╭",
    --   top_right = "╮",
    --   bottom_left = "╰",
    --   bottom_right = "╯",
    -- },
    -- line_width = 70, -- width of the lines
    -- line = { -- symbols used to draw a line
    --   line = "─",
    --   line_start = "─",
    --   line_end = "─",
    -- },
    -- outer_blank_lines = false, -- insert a blank line above and below the box
    -- inner_blank_lines = false, -- insert a blank line above and below the text
    -- line_blank_line_above = false, -- insert a blank line above the line
    -- line_blank_line_below = false, -- insert a blank line below the line
  }
  -- left aligned fixed size box with left aligned text
  keymap({ "n", "v" }, "<Leader>bb", cb.lbox, {})
  -- centered adapted box with centered text
  keymap({ "n", "v" }, "<Leader>bc", cb.accbox, {})

  -- centered line
  keymap("n", "<Leader>bl", cb.cline, {})
  keymap("i", "<M-l>", cb.cline, {})
  keymap("n", "<M-/>", cb.lbox, {})
end
