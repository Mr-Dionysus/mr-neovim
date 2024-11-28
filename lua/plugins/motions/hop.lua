--                                  ╭─────────╮
--                                  │ Motions │
--                                  ╰─────────╯
-- Hop is an EasyMotion-like plugin allowing you to jump
-- anywhere in a document with as few keystrokes as possible.

return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  init = function()
    -- place this in one of your configuration file(s)
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
      }
    end, { remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
      }
    end, { remap = true })
    vim.keymap.set('', 't', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1,
      }
    end, { remap = true })
    vim.keymap.set('', 'T', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
      }
    end, { remap = true })
    vim.keymap.set('', 's', ':HopWord<CR>', { remap = true })
  end,
}
