return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  --
  -- {
  --   'goolord/alpha-nvim',
  --   -- dependencies = { 'echasnovski/mini.icons' },
  --   dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     local theta = require 'alpha.themes.theta'
  --     -- available: devicons, mini, default is mini
  --     -- if provider not loaded and enabled is true, it will try to use another provider
  --     theta.file_icons.provider = 'devicons'
  --     require('alpha').setup(theta.config)
  --   end,
  -- },
}
