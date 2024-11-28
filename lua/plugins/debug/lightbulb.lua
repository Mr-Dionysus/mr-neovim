--                           ╭──────────────────────╮
--                           │ LSP Lightbulb Action │
--                           ╰──────────────────────╯
-- VSCode 💡 for neovim's built-in LSP.
return {
  'kosayoda/nvim-lightbulb',
  init = function()
    require('nvim-lightbulb').setup {
      autocmd = { enabled = true },
    }
  end,
}
