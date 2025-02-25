--                               ╭──────────────╮
--                               │ Color Picker │
--                               ╰──────────────╯
-- Color picker and highlighter plugin for Neovim.

return {
  'uga-rosa/ccc.nvim',
  init = function()
    require('ccc').setup {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    }
    vim.keymap.set(
      'n',
      '<leader>op',
      ':CccPick<CR>',
      { desc = '[P]ick Color', silent = true }
    )
  end,
}
