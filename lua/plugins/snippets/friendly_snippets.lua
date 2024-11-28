--                            ╭─────────────────────╮
--                            │ Predefined Snippets │
--                            ╰─────────────────────╯
-- Set of preconfigured snippets for different languages.
return {
  'rafamadriz/friendly-snippets',
  init = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
