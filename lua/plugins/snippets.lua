return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },

  {
    'rafamadriz/friendly-snippets',
    init = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  -- {
  -- "chrisgrieser/nvim-scissors",
  -- dependencies = "nvim-telescope/telescope.nvim",
  -- opts = {
  -- 	snippetDir = "path/to/your/snippetFolder",
  -- }
  -- },
}
