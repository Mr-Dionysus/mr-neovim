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
        { desc = '[D]ebug [Diff] View' }
      ),
      vim.keymap.set(
        '',
        '<leader>gD',
        ':DiffviewClose<CR>',
        { desc = 'Close [D]ebug [Diff] View' }
      ),
    }
  end,
}
