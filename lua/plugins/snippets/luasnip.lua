--                                 ╭──────────╮
--                                 │ Snippets │
--                                 ╰──────────╯
-- Snippet Engine for Neovim written in Lua.
return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local ls = require 'luasnip'

    -- See HTML as HTMLDjango files
    ls.filetype_extend('html', { 'htmldjango' })
    ls.filetype_extend('htmldjango', { 'html' })
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load { paths = './snippets' }
  end,
  keys = function()
    -- Disable default tab keybinding in LuaSnip
    return {}
  end,
}
