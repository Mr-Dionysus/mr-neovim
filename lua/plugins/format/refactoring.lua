--                                ╭─────────────╮
--                                │ Refactoring │
--                                ╰─────────────╯
-- The Refactoring library based off the Refactoring book by Martin Fowler.

return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  config = function()
    require('refactoring').setup()
  end,
}
