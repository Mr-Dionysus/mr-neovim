--                                   ╭───────╮
--                                   │ Tests │
--                                   ╰───────╯
-- An extensible framework for interacting with tests within NeoVim.
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  init = function()
    require('neotest').setup {
      adapters = {},
    }
  end,
}
