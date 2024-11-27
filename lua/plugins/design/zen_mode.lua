return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    vim.keymap.set(
      '',
      '<leader>tz',
      ':ZenMode<CR>',
      { desc = '[T]oggle [Z]en' }
    )
  end,
}
