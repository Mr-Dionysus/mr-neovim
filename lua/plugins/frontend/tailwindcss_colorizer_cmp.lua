--                                 ╭──────────╮
--                                 │ Tailwind │
--                                 ╰──────────╯
-- 🌈 A Neovim plugin to add vscode-style TailwindCSS completion to nvim-cmp.

return {
  'roobert/tailwindcss-colorizer-cmp.nvim',
  -- optionally, override the default options:

  config = function()
    require('tailwindcss-colorizer-cmp').setup {
      color_square_width = 2,
    }
  end,
}
