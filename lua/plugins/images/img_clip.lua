--                               ╭──────────────╮
--                               │ Paste Images │
--                               ╰──────────────╯
-- Effortlessly embed images into any markup language, like LaTeX,
-- Markdown or Typst.

return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    {
      '<leader>p',
      '<cmd>PasteImage<cr>',
      desc = 'Paste image from system clipboard',
    },
  },
  init = function()
    require('img-clip').setup()
  end,
}
