--                           ╭──────────────────────╮
--                           │ Annotation Generator │
--                           ╰──────────────────────╯
-- A better annotation generator. Supports multiple languages
-- and annotation conventions.
return {
  'danymat/neogen',
  keys = {
    {
      '<leader>lD',
      ':Neogen<CR>',
      mode = { 'n' },
      desc = '[D]ocument Generator',
      silent = true,
    },
  },
  config = true,
  init = function()
    require('neogen').setup { snippet_engine = 'luasnip' }
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
