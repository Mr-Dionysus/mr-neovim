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

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  {
    'uga-rosa/ccc.nvim',
    init = function()
      require('ccc').setup()
    end,
  },

  {
    'brenoprata10/nvim-highlight-colors',
    init = function()
      require('nvim-highlight-colors').setup {}
    end,
  },
}
