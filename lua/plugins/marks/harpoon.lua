--                             ╭──────────────────╮
--                             │ Fast File Switch │
--                             ╰──────────────────╯
-- Pin files and switch between them with ease.
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<C-e>',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      mode = { 'n' },
      desc = 'Open Harpoon Window',
    },
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      mode = { 'n' },
      desc = '[A]dd Buffer',
    },
    {
      '<C-t>',
      function()
        require('harpoon'):list():select(1)
      end,
      mode = { 'n' },
      desc = 'Select Buffer 1',
    },
    {
      '<C-n>',
      function()
        require('harpoon'):list():select(2)
      end,
      mode = { 'n' },
      desc = 'Select Buffer 2',
    },
    {
      '<C-s>',
      function()
        require('harpoon'):list():select(3)
      end,
      mode = { 'n' },
      desc = 'Select Buffer 3',
    },
    -- {
    --   '<C-q>',
    --   function()
    --     require('harpoon'):list():select(4)
    --   end,
    --   mode = { 'n' },
    --   desc = 'Select Buffer 4',
    -- },

    -- Toggle previous & next buffers stored within Harpoon list
    {
      '<C-z>',
      function()
        require('harpoon'):list():prev()
      end,
      mode = { 'n' },
      desc = '[P]revious Buffer',
    },
    {
      '<C-x>',
      function()
        require('harpoon'):list():next()
      end,
      mode = { 'n' },
      desc = '[N]ext Buffer',
    },
  },
  init = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
  end,
}
