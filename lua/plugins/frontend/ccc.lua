--                               ╭──────────────╮
--                               │ Color Picker │
--                               ╰──────────────╯
-- Color picker and highlighter plugin for Neovim.

return {
  'uga-rosa/ccc.nvim',
  init = function()
    require('ccc').setup()
  end,
}
