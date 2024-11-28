--                             ╭───────────────────╮
--                             │ TypeScript Errors │
--                             ╰───────────────────╯
-- A Neovim port of Matt Pocock's ts-error-translator for VSCode
-- for turning messy and confusing TypeScript errors into plain English.

return {
  'dmmulroy/ts-error-translator.nvim',
  init = function()
    require('ts-error-translator').setup()
  end,
}
