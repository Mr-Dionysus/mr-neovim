--                           ╭──────────────────────╮
--                           │ Annotation Generator │
--                           ╰──────────────────────╯
-- A better annotation generator. Supports multiple languages
-- and annotation conventions.

return {
  'danymat/neogen',
  config = true,
  init = function()
    vim.keymap.set(
      'n',
      '<leader>lD',
      ':Neogen<CR>',
      { desc = '[D]ocument Generator', silent = true }
    )
    require('neogen').setup { snippet_engine = 'luasnip' }
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
