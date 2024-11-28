--                            ╭─────────────────────╮
--                            │ Increment/Decrement │
--                            ╰─────────────────────╯
-- Enhanced increment/decrement plugin for Neovim.

return {
  'monaqa/dial.nvim',
  init = function()
    vim.keymap.set('n', '<M-a>', function()
      require('dial.map').manipulate('increment', 'normal')
    end)
    vim.keymap.set('n', '<M-x>', function()
      require('dial.map').manipulate('decrement', 'normal')
    end)
    vim.keymap.set('n', 'g<M-a>', function()
      require('dial.map').manipulate('increment', 'gnormal')
    end)
    vim.keymap.set('n', 'g<M-x>', function()
      require('dial.map').manipulate('decrement', 'gnormal')
    end)
    vim.keymap.set('v', '<M-a>', function()
      require('dial.map').manipulate('increment', 'visual')
    end)
    vim.keymap.set('v', '<M-x>', function()
      require('dial.map').manipulate('decrement', 'visual')
    end)
    vim.keymap.set('v', 'g<M-a>', function()
      require('dial.map').manipulate('increment', 'gvisual')
    end)
    vim.keymap.set('v', 'g<M-x>', function()
      require('dial.map').manipulate('decrement', 'gvisual')
    end)
  end,
}
