--                              ╭────────────────╮
--                              │ LSP Diagnostic │
--                              ╰────────────────╯
-- 🚦 A pretty diagnostics, references, telescope results,
-- quickfix and location list to help you solve all the
-- trouble your code is causing.
return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.

  cmd = 'Trouble',

  keys = {
    {
      '<leader>mf',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[F]iles',
    },
    {
      '<leader>ls',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[S]ymbols',
    },
    {
      '<leader>lr',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = '[R]eferences',
    },
  },
}
