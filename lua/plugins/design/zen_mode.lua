--                                 ╭──────────╮
--                                 │ Zen Mode │
--                                 ╰──────────╯
-- 🧘 Distraction-free coding for Neovim.

return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      '<leader>tz',
      ':ZenMode<CR>',
      mode = { 'n' },
      desc = '[Z]en',
      silent = true,
    },
  },
}
