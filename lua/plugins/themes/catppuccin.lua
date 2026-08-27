return {
  'catppuccin/nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
    -- vim.cmd.colorscheme 'dracula'
    -- vim.cmd.colorscheme 'sonokai'
    vim.cmd.colorscheme 'catppuccin-mocha'
    -- vim.cmd.colorscheme 'tokyonight-moon'
    -- vim.cmd.colorscheme 'tokyonight-night'
  end,

  config = function()
    require('catppuccin').setup {
      custom_highlights = function(colors)
        return {
          LspInlayHint = {
            fg = colors.overlay1,
          },
        }
      end,
    }
  end,
}
