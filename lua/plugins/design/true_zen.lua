--                              ╭─────────────────╮
--                              │ Focus on Window │
--                              ╰─────────────────╯
-- 🧘 Distraction-free coding for Neovim.

return {
  'pocco81/true-zen.nvim',
  keys = {
    {
      '<leader>tf',
      ':TZFocus<CR>',
      mode = { '' },
      desc = '[F]ocus',
      silent = true,
    },
  },
}
