--                                 ╭──────────╮
--                                 │ Git Diff │
--                                 ╰──────────╯
-- Single tabpage interface for easily cycling through
-- diffs for all modified files for any git rev.

return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Required dependency
  config = function()
    -- Optional: Plugin configuration
    require('diffview').setup {
      -- Customize diffview settings here
      vim.keymap.set(
        '',
        '<leader>gd',
        ':DiffviewOpen<CR>',
        { desc = '[D]iff in Files (Open)', silent = true }
      ),
      vim.keymap.set(
        '',
        '<leader>gD',
        ':DiffviewClose<CR>',
        { desc = '[D]iff in Files (Close)', silent = true }
      ),
    }
  end,
}
