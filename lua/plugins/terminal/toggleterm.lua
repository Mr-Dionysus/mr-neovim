--                                 ╭──────────╮
--                                 │ Terminal │
--                                 ╰──────────╯
-- A neovim lua plugin to help easily manage multiple terminal windows.

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
  },
  init = function()
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
  config = function()
    require('toggleterm').setup()
    vim.keymap.set(
      '',
      '<leader>tt',
      ':ToggleTerm direction=float<CR>',
      { desc = '[T]oggle [T]erminal', silent = true }
    )
    vim.keymap.set(
      '',
      '<leader>t-',
      ':ToggleTerm direction=horizontal<CR>',
      { desc = '[T]erminal -----' }
    )
    vim.keymap.set(
      '',
      '<leader>t|',
      ':ToggleTerm direction=vertical<CR>',
      { desc = '[T]erminal |||||' }
    )
  end,
}
