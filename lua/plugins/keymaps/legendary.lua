--                                  ╭─────────╮
--                                  │ Keymaps │
--                                  ╰─────────╯
-- 🗺️ A legend for your keymaps, commands, and autocmds,
-- integrates with which-key.nvim, lazy.nvim, and more.

return {
  'mrjones2014/legendary.nvim',
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  init = function()
    require('legendary').setup {
      extensions = {
        which_key = true,
      },
    }
  end,
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
}
