--                                  ╭────────╮
--                                  │ GitHub │
--                                  ╰────────╯
-- Edit and review GitHub issues and pull requests
-- from the comfort of your favorite editor.

return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup()
  end,
}
