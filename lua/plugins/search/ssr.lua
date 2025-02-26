--                             ╭──────────────────╮
--                             │ Find and Replace │
--                             ╰──────────────────╯
-- Treesitter based structural search and replace plugin for Neovim.
return {
  'cshuaimin/ssr.nvim',
  module = 'ssr',
  keys = {
    {
      '<leader>iR',
      function()
        require('ssr').open()
      end,
      mode = { 'n', 'x' },
      desc = '[R]ename in Buffer via SSR',
    },
  },
  -- Calling setup is optional.
  config = function()
    require('ssr').setup {
      border = 'rounded',
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      adjust_window = true,
      keymaps = {
        close = 'q',
        next_match = 'n',
        prev_match = 'N',
        replace_confirm = '<cr>',
        replace_all = '<leader><cr>',
      },
    }
  end,
}
