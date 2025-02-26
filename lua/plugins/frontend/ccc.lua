--                               ╭──────────────╮
--                               │ Color Picker │
--                               ╰──────────────╯
-- Color picker and highlighter plugin for Neovim.

return {
  'uga-rosa/ccc.nvim',
  keys = {
    {
      '<leader>op',
      ':CccPick<CR>',
      mode = { 'n' },
      desc = '[P]ick Color',
      silent = true,
    },
  },
  init = function()
    require('ccc').setup {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    }
  end,
}
