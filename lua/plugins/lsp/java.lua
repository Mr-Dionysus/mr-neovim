--                                   ╭──────╮
--                                   │ Java │
--                                   ╰──────╯
-- Painless Java in Neovim.
return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup()
    vim.lsp.enable 'jdtls'
  end,
}
