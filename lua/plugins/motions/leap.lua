--                                  ╭─────────╮
--                                  │ Motions │
--                                  ╰─────────╯
-- Leap is a general-purpose motion plugin for Neovim,
-- building and improving primarily on vim-sneak, with
-- the ultimate goal of establishing a new standard
-- interface for moving around in the visible area in
-- Vim-like modal editors.

return {
  'ggandor/leap.nvim',
  init = function()
    require('leap').create_default_mappings()
  end,
}
