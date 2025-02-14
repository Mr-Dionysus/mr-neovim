--                             ╭──────────────────╮
--                             │ Find and Replace │
--                             ╰──────────────────╯
-- Find the enemy and replace them with dark power.
return {
  'nvim-pack/nvim-spectre',
  init = function()
    vim.keymap.set(
      'n',
      '<leader>it',
      '<cmd>lua require("spectre").toggle()<CR>',
      {
        desc = '[T]oggle Spectre',
      }
    )
    vim.keymap.set(
      'n',
      '<leader>is',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      {
        desc = "[S]pectre's Rename in Files",
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
      '<leader>ir',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      {
        desc = '[R]ename in Buffer via Spectre',
      },
      require('spectre').setup {
        use_trouble_qf = true,
      }
    )
  end,
}
