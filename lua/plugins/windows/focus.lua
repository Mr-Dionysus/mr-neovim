return {
  'nvim-focus/focus.nvim',
  version = false,
  init = function()
    require('focus').setup()
  end,
}
