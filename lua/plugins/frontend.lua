return {
  -- tailwind-tools.lua
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },

  { 'mistweaverco/kulala.nvim', opts = {} },

  {
    'rest-nvim/rest.nvim',
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    init = function()
      require('ts-error-translator').setup()
    end,
  },

  {
    'dmmulroy/tsc.nvim',
    init = function()
      require('tsc').setup()
    end,
  },
}
