--                            ╭─────────────────────╮
--                            │ Increment/Decrement │
--                            ╰─────────────────────╯
-- Enhanced increment/decrement plugin for Neovim.

return {
  'monaqa/dial.nvim',
  keys = {
    {
      'M-a',
      function()
        require('dial.map').manipulate('increment', 'normal')
      end,
      mode = { 'n' },
      desc = 'Increment',
    },
    {
      'M-x',
      function()
        require('dial.map').manipulate('decrement', 'normal')
      end,
      mode = { 'n' },
      desc = 'Decrement',
    },
    {
      'g<M-a>',
      function()
        require('dial.map').manipulate('increment', 'gnormal')
      end,
      mode = { 'n' },
      desc = 'Increment (G)',
    },
    {
      'g<M-x>',
      function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end,
      mode = { 'n' },
      desc = 'Decrement (G)',
    },
    {
      '<M-a>',
      function()
        require('dial.map').manipulate('increment', 'visual')
      end,
      mode = { 'v' },
      desc = 'Decrement',
    },
    {
      '<M-x>',
      function()
        require('dial.map').manipulate('decrement', 'visual')
      end,
      mode = { 'v' },
      desc = 'Decrement',
    },
    {
      'g<M-a>',
      function()
        require('dial.map').manipulate('increment', 'gvisual')
      end,
      mode = { 'v' },
      desc = 'Decrement (G)',
    },
    {
      'g<M-x>',
      function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end,
      mode = { 'v' },
      desc = 'Decrement (G)',
    },
  },
}
