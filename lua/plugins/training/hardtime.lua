--                             ╭──────────────────╮
--                             │ Crush Bad Habits │
--                             ╰──────────────────╯
-- Establish good command workflow and quit bad habit.
return {
  'm4xshen/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  opts = {},
  init = function()
    require('hardtime').setup()
  end,
}
