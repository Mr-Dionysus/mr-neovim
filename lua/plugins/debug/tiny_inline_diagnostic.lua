--                                ╭─────────────╮
--                                │ Diagnostics │
--                                ╰─────────────╯
-- A Neovim plugin that display prettier diagnostic messages.
-- Display diagnostic messages where the cursor is, with icons
-- and colors.
return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',

    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
    end,
  },
}
