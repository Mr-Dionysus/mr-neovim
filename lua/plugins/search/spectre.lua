--                             ╭──────────────────╮
--                             │ Find and Replace │
--                             ╰──────────────────╯
-- Find the enemy and replace them with dark power.
return {
  'nvim-pack/nvim-spectre',
  keys = {
    {
      '<leader>it',
      '<cmd>lua require("spectre").toggle()<CR>',
      mode = { 'n' },
      desc = '[T]oggle Spectre',
    },
    {
      '<leader>is',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      mode = { 'n' },
      desc = "[S]pectre's Rename in Files",
    },
    {
      '<leader>sw',
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      mode = { 'v' },
      desc = '[S]earch Current [W]ord',
    },
    {
      '<leader>ir',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      function()
        require('spectre').setup {
          use_trouble_qf = true,
        }
      end,
      mode = { 'n' },
      desc = '[R]ename in Buffer via Spectre',
    },
  },
}
