--                                 ╭──────────╮
--                                 │ Tailwind │
--                                 ╰──────────╯
-- An unofficial Tailwind CSS integration and tooling for Neovim.

return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },
  opts = {}, -- your configuration
}
