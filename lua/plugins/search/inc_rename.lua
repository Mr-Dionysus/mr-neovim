--                                  ╭─────────╮
--                                  │ Replace │
--                                  ╰─────────╯
-- Incremental LSP renaming based on Neovim's command-preview feature.
return {
  'smjonas/inc-rename.nvim',
  config = function()
    require('inc_rename').setup()
  end,
}
