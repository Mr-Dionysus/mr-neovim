--                           ╭───────────────────────╮
--                           │ TypeScript Type Check │
--                           ╰───────────────────────╯
-- A Neovim plugin for seamless, asynchronous project-wide TypeScript
-- type-checking using the TypeScript compiler (tsc).

return {
  'dmmulroy/tsc.nvim',
  init = function()
    require('tsc').setup()
  end,
}
