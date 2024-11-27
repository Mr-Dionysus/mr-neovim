return {
  'pocco81/true-zen.nvim',
  config = function()
    vim.keymap.set(
      '',
      '<leader>tF',
      ':TZFocus<CR>',
      { desc = '[T]oggle [F]ocus' }
    )
  end,
}
