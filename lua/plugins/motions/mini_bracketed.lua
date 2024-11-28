--                            ╭─────────────────────╮
--                            │ Go Forward/Backward │
--                            ╰─────────────────────╯
-- Go forward/backward with square brackets.

return {
  'echasnovski/mini.bracketed',
  version = false,
  init = function()
    require('mini.bracketed').setup()
  end,
}
