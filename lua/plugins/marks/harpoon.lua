--                             ╭──────────────────╮
--                             │ Fast File Switch │
--                             ╰──────────────────╯
-- Pin files and switch between them with ease.

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open Harpoon Window' })

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[A]dd Buffer' })

    vim.keymap.set('n', '<C-t>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-s>', function()
      harpoon:list():select(3)
    end)
    -- vim.keymap.set('n', '<C-s>', function()
    --   harpoon:list():select(4)
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-z>', function()
      harpoon:list():prev()
    end, { desc = '[P]revious Buffer' })
    vim.keymap.set('n', '<C-x>', function()
      harpoon:list():next()
    end, { desc = '[N]ext Buffer' })
  end,
}
