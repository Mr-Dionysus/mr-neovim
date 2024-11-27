return {
  'rafamadriz/friendly-snippets',
  init = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
