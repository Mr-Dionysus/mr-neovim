--                              ╭─────────────────╮
--                              │ Focus on Window │
--                              ╰─────────────────╯
-- 🧘 Distraction-free coding for Neovim.

return {
  'pocco81/true-zen.nvim',
  config = function()
    vim.keymap.set(
      '',
      '<leader>tf',
      ':TZFocus<CR>',
      { desc = '[F]ocus', silent = true }
    )
  end,
}
