--                                 ╭──────────╮
--                                 │ Snippets │
--                                 ╰──────────╯
-- Snippet Engine for Neovim written in Lua.
return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  keys = function()
    -- Disable default tab keybinding in LuaSnip
    return {}
  end,
}
