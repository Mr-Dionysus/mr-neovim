--                             ╭──────────────────╮
--                             │ Custom Dashboard │
--                             ╰──────────────────╯
-- A highly configurable neovim startup screen.

return {
  'startup-nvim/startup.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require('startup').setup()
  end,
}
