return {
  'mfussenegger/nvim-treehopper',
  keys = {
    {
      'm',
      ":<C-U>lua require('tsht').nodes()<CR>",
      mode = 'o',
      silent = true,
      desc = 'Trigger tsht nodes in operator mode',
    },
    {
      'm',
      ":lua require('tsht').nodes()<CR>",
      mode = 'x',
      silent = true,
      desc = 'Trigger tsht nodes in visual mode',
    },
  },
}
