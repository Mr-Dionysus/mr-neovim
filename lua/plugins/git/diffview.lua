--                                 ╭──────────╮
--                                 │ Git Diff │
--                                 ╰──────────╯
-- Single tabpage interface for easily cycling through
-- diffs for all modified files for any git rev.
return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
  keys = {
    {
      '<leader>gd',
      ':DiffviewOpen<CR>',
      mode = { '' },
      desc = '[D]iff in Files (Open)',
      silent = true,
    },
    {
      '<leader>gD',
      ':DiffviewClose<CR>',
      mode = { '' },
      desc = '[D]iff in Files (Close)',
      silent = true,
    },
  },
  config = function()
    -- Optional: Plugin configuration
    require('diffview').setup {
      -- Customize diffview settings here
    }
  end,
}
