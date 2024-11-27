return {
  'nvim-java/nvim-java',
  init = function()
    require('java').setup()
    require('lspconfig').jdtls.setup {}
  end,
}
