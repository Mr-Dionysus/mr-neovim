return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },

  {
    'pocco81/true-zen.nvim',
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
  },

  -- {
  --   'dstein64/nvim-scrollview',
  -- },
  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require 'codewindow'
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },
}
