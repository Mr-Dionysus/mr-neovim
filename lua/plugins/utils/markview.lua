--                                 ╭──────────╮
--                                 │ Markdown │
--                                 ╰──────────╯
-- A hackable markdown, Typst, latex, html(inline)
-- & YAML previewer for Neovim
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  init = function()
    local presets = require 'markview.presets'

    require('markview').setup {
      markdown = {
        headings = presets.headings.glow,
      },
    }

    require('markview').setup {
      markdown = {
        horizontal_rules = presets.horizontal_rules.thin,
      },
    }

    require('markview').setup {
      markdown = {
        tables = presets.tables.rounded,
      },
    }
  end,
}
