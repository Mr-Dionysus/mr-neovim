--                               ╭───────────────╮
--                               │ Documentation │
--                               ╰───────────────╯
-- To generate documentation.

return {
  'echasnovski/mini.doc',
  version = false,
  init = function()
    require('mini.doc').setup()
  end,
}
