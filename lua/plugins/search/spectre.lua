--                             ╭──────────────────╮
--                             │ Find and Replace │
--                             ╰──────────────────╯
-- Find the enemy and replace them with dark power.
return {
  'nvim-pack/nvim-spectre',
  init = function()
    vim.keymap.set(
      'n',
      '<leader>sS',
      '<cmd>lua require("spectre").toggle()<CR>',
      {
        desc = 'Toggle Spectre',
      }
    )
    vim.keymap.set(
      'n',
      '<leader>sw',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      {
        desc = 'Search current word',
      }
    )
    vim.keymap.set(
      'v',
      '<leader>sw',
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      {
        desc = 'Search current word',
      }
    )
    vim.keymap.set(
      'n',
      '<leader>si',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      {
        desc = '[S]earch [I]n File',
      }
    )
  end,
}
