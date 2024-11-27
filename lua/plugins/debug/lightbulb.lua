return {
  'kosayoda/nvim-lightbulb',
  init = function()
    require('nvim-lightbulb').setup {
      autocmd = { enabled = true },
    }
  end,
}
