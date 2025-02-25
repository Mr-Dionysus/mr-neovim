--                                  ╭────────╮
--                                  │ Git UI │
--                                  ╰────────╯
-- An interactive and powerful Git interface for Neovim, inspired by Magit.

return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
  init = function()
    vim.keymap.set(
      'n',
      '<leader>gn',
      ':Neogit help<CR>',
      { desc = '[N]eogit', silent = true }
    )
  end,
}
