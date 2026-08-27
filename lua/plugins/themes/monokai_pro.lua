--
--                              Monokai Pro
--
-- Monokai Pro theme for Neovim written
-- in Lua, with multiple filters: Pro, Classic,
-- Machine, Octagon, Ristretto, Spectrumreturn
return {
  'loctvl842/monokai-pro.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('monokai-pro').setup()
  end,
}
