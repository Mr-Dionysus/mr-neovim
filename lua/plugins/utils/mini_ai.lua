--                              ╭─────────────────╮
--                              │ a/i Textobjects │
--                              ╰─────────────────╯
-- Enhances a/i textobjects.

return {
  'echasnovski/mini.ai',
  version = '*',
  init = function()
    require('mini.ai').setup()
  end,
}
