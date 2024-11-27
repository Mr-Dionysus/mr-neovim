return {
  'nvimdev/zephyr-nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
