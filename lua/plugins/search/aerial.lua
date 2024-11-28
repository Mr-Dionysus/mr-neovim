--                               ╭──────────────╮
--                               │ Code Outline │
--                               ╰──────────────╯
-- Neovim plugin for a code outline window.
return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    require('aerial').setup()
  end,
}
