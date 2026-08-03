--                                  ╭────────╮
--                                  │ Git UI │
--                                  ╰────────╯
-- An interactive and powerful Git interface for Neovim, inspired by Magit.

return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  cmd = 'Neogit',
  keys = {
    {
      '<leader>gn',
      ':Neogit help<CR>',
      mode = { 'n' },
      desc = '[N]eogit',
      silent = true,
    },
  },
}
