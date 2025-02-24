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
    --
    -- Use the traversal keys to repeat the previous motion without
    -- explicitly invoking Leap:
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')
    -- Define a preview filter (skip the middle of alphanumeric words):
    require('leap').opts.preview_filter = function(ch0, ch1, ch2)
      return not (
        ch1:match '%s'
        or ch0:match '%w' and ch1:match '%w' and ch2:match '%w'
      )
    end
    -- Or just set to grey directly, e.g. { fg = '#777777' },
    -- if Comment is saturated.
    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  end,
}
