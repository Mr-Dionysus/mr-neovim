return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'echasnovski/mini.ai',
    version = '*',
    init = function()
      require('mini.ai').setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
  },

  {
    'MunifTanjim/nui.nvim',
  },

  {
    'nvim-tree/nvim-web-devicons',
    init = function()
      require('nvim-web-devicons').setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = '',
            color = '#428850',
            cterm_color = '65',
            name = 'Zsh',
          },
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true,
        -- set the light or dark variant manually, instead of relying on `background`
        -- (default to nil)
        variant = 'light|dark',
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          ['.gitignore'] = {
            icon = '',
            color = '#f1502f',
            name = 'Gitignore',
          },
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ['log'] = {
            icon = '',
            color = '#81e043',
            name = 'Log',
          },
        },
        -- same as `override` but specifically for operating system
        -- takes effect when `strict` is true
        override_by_operating_system = {
          ['apple'] = {
            icon = '',
            color = '#A2AAAD',
            cterm_color = '248',
            name = 'Apple',
          },
        },
      }
    end,
  },

  {
    'gbprod/yanky.nvim',
    dependencies = {
      { 'kkharji/sqlite.lua' },
    },
    opts = {
      ring = { storage = 'sqlite' },
    },
    keys = {
      {
        '<leader>p',
        function()
          require('telescope').extensions.yank_history.yank_history {}
        end,
        desc = 'Open Yank History',
      },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
      { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
      { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
      { '<c-p>', '<Plug>(YankyPreviousEntry)', desc = 'Select previous entry through yank history' },
      { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },
      { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
      { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
  },

  {
    'windwp/nvim-ts-autotag',
    init = function()
      require('nvim-ts-autotag').setup {
        opts = {

          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        -- per_filetype = {
        --   ['html'] = {
        --     enable_close = true,
        --   },
        -- },
      }
    end,
  },

  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },

  { 'kevinhwang91/promise-async' },

  {
    'cshuaimin/ssr.nvim',
    module = 'ssr',
    -- Calling setup is optional.
    config = function()
      require('ssr').setup {
        border = 'rounded',
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        adjust_window = true,
        keymaps = {
          close = 'q',
          next_match = 'n',
          prev_match = 'N',
          replace_confirm = '<cr>',
          replace_all = '<leader><cr>',
        },
      }
      vim.keymap.set({ 'n', 'x' }, '<leader>sR', function()
        require('ssr').open()
      end)
    end,
  },

  {
    'echasnovski/mini.bracketed',
    version = false,
    init = function()
      require('mini.bracketed').setup()
    end,
  },

  {
    'echasnovski/mini.doc',
    version = false,
    init = function()
      require('mini.doc').setup()
    end,
  },

  {
    'echasnovski/mini.files',
    version = false,
    init = function()
      require('mini.files').setup()
    end,
  },

  {
    'echasnovski/mini-git',
    version = false,
    main = 'mini.git',

    init = function()
      require('mini.git').setup()
    end,
  },

  {
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
  },

  {
    'vuki656/package-info.nvim',
    requires = 'MunifTanjim/nui.nvim',
    init = function()
      require('package-info').setup()
    end,
  },

  {
    'ecthelionvi/NeoComposer.nvim',
    dependencies = { 'kkharji/sqlite.lua' },
    opts = {},
  },
}
