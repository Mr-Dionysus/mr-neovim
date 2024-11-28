--                             ╭───────────────────╮
--                             │ Surrounding Pairs │
--                             ╰───────────────────╯
-- Add/change/delete surrounding delimiter pairs with ease.
-- Written with ❤️ in Lua.

return {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {
      keymaps = {
        insert = '<C-g>s',
        insert_line = '<C-g>S',
        normal = '?s',
        normal_cur = 'yss',
        normal_line = '?S',
        normal_cur_line = '?SS',
        visual = '?S',
        visual_line = 'gS',
        delete = '?d',
        change = '?c',
        change_line = '?C',
      },
    }
  end,
}
