return {
  'folke/twilight.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },

  config = function()
    vim.keymap.set(
      '',
      '<leader>td',
      ':Twilight<CR>',
      { desc = '[T]oggle [D]ark Twilight' }
    )
  end,
}
