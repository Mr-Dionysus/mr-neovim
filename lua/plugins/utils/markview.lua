--                                 ╭──────────╮
--                                 │ Markdown │
--                                 ╰──────────╯
-- A hackable markdown, Typst, latex, html(inline)
-- & YAML previewer for Neovim
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  init = function()
    -- vim.cmd.colorscheme 'dracula'
    -- vim.cmd.colorscheme 'sonokai'
    vim.cmd.colorscheme 'catppuccin-mocha'
    -- vim.cmd.colorscheme 'tokyonight-moon'
    -- vim.cmd.colorscheme 'tokyonight-night'
    local presets = require 'markview.presets'

    require('markview').setup {
      markdown = {
        headings = presets.headings.glow,
      },
    }

    local presets = require('markview.presets').tables

    require('markview').setup {
      markdown = {
        tables = presets.rounded,
      },
    }
  end,
}
