--                         ╭──────────────────────────╮
--                         │ Open Folders with Neovim │
--                         ╰──────────────────────────╯
-- Neovim file explorer: edit your filesystem like a buffer.

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  init = function()
    require('oil').setup()
  end,
}
