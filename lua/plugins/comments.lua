return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'LudoPinelli/comment-box.nvim' },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },

  {
    'danymat/neogen',
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
