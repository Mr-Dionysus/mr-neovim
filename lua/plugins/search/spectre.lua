--                             ╭──────────────────╮
--                             │ Find and Replace │
--                             ╰──────────────────╯
-- Find the enemy and replace them with dark power.
return {
  'nvim-pack/nvim-spectre',
  init = function()
    vim.keymap.set(
      'n',
      '<leader>rS',
      '<cmd>lua require("spectre").toggle()<CR>',
      {
        desc = '[T]oggle [S]pectre',
      }
    )
    vim.keymap.set(
      'n',
      '<leader>sw',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      {
        desc = '[S]earch Current [W]ord',
      }
    )
    vim.keymap.set(
      'v',
      '<leader>sw',
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      {
        desc = '[S]earch Current [W]ord',
      }
    )
    vim.keymap.set(
      'n',
      '<leader>si',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      {
        desc = '[S]earch [I]n File',
      },
      require('spectre').setup {
        use_trouble_qf = true,
      }
    )
  end,
}
