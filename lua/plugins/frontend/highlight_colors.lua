--                                ╭─────────────╮
--                                │ Highlighter │
--                                ╰─────────────╯
-- Highlight colors for Neovim.

return {
  'brenoprata10/nvim-highlight-colors',
  init = function()
    require('nvim-highlight-colors').setup {}
  end,
}
