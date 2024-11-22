return {
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
      require('marks').setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { '.', '<', '>', '^' },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- disables mark tracking for specific buftypes. default {}
        excluded_buftypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = '⚑',
          virt_text = 'hello world',
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
          annotate = false,
        },
        mappings = {},
      }
    end,
  },

  -- {
  --   'ThePrimeagen/harpoon',
  --   branch = 'harpoon2',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   init = function()
  --     local harpoon = require 'harpoon'
  --
  --     -- REQUIRED
  --     harpoon:setup()
  --     -- REQUIRED
  --     ---- basic telescope configuration
  --     local conf = require('telescope.config').values
  --     local function toggle_telescope(harpoon_files)
  --       local file_paths = {}
  --       for _, item in ipairs(harpoon_files.items) do
  --         table.insert(file_paths, item.value)
  --       end
  --
  --       require('telescope.pickers')
  --         .new({}, {
  --           prompt_title = 'Harpoon',
  --           finder = require('telescope.finders').new_table {
  --             results = file_paths,
  --           },
  --           previewer = conf.file_previewer {},
  --           sorter = conf.generic_sorter {},
  --         })
  --         :find()
  --     end
  --
  --     vim.keymap.set('n', '<C-e>', function()
  --       harpoon.ui:toggle_quick_menu(harpoon:list())
  --     end, { desc = 'Open harpoon window' })
  --
  --     vim.keymap.set('n', '<leader>a', function()
  --       harpoon:list():add()
  --     end)
  --
  --     vim.keymap.set('n', '<C-h>', function()
  --       harpoon:list():select(1)
  --     end)
  --     vim.keymap.set('n', '<C-t>', function()
  --       harpoon:list():select(2)
  --     end)
  --     vim.keymap.set('n', '<C-n>', function()
  --       harpoon:list():select(3)
  --     end)
  --     vim.keymap.set('n', '<C-s>', function()
  --       harpoon:list():select(4)
  --     end)
  --
  --     -- Toggle previous & next buffers stored within Harpoon list
  --     vim.keymap.set('n', '<C-S-P>', function()
  --       harpoon:list():prev()
  --     end)
  --     vim.keymap.set('n', '<C-S-N>', function()
  --       harpoon:list():next()
  --     end)
  --   end,
  -- },

  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git', -- also try out "git_branch"
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<leader>M', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
      { '<leader>m', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
      { '<leader>n', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
      { '<leader>p', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
    },
  },
}
