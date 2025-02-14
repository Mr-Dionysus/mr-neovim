--                                 ╭───────────╮
--                                 │ Pin Files │
--                                 ╰───────────╯
-- Neovim plugin for tagging important files.

return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    {
      '<leader>T',
      '<cmd>Grapple toggle<cr>',
      desc = '[T]oggle Tag',
    },
    {
      '<leader>c',
      '<cmd>Grapple toggle_tags<cr>',
      desc = '[C]hange Buffers',
    },
    {
      '<leader>n',
      '<cmd>Grapple cycle_tags next<cr>',
      desc = '[N]ext Buffer',
    },
    {
      '<leader>p',
      '<cmd>Grapple cycle_tags prev<cr>',
      desc = '[P]revious Buffer',
    },
  },
}
