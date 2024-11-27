return {
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      vim.keymap.set(
        '',
        '<leader>tz',
        ':ZenMode<CR>',
        { desc = '[T]oggle [Z]en' }
      )
    end,
  },

  {
    'pocco81/true-zen.nvim',
    config = function()
      vim.keymap.set(
        '',
        '<leader>tF',
        ':TZFocus<CR>',
        { desc = '[T]oggle [F]ocus' }
      )
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    init = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }

      local require = require 'noice.util.lazy'

      local Msg = require 'noice.ui.msg'

      local M = {}

      ---@type table<string, NoiceFilter>
      M.defaults = {
        ruler = { event = Msg.events.ruler },
        message = { event = Msg.events.show },
        command = { event = Msg.events.showcmd },
        mode = { event = Msg.events.showmode },
        search = { event = Msg.events.show, kind = Msg.kinds.search_count },
      }

      return M
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    'xiyaowong/transparent.nvim',
  },

  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    config = function()
      vim.keymap.set(
        '',
        '<leader>td',
        ':Twilight<CR>',
        { desc = '[T]oggle [D]ark Twilight' }
      )
    end,
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
    'rcarriga/nvim-notify',
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      exclude = { filetypes = { 'dashboard' } },
    },
    init = function()
      require('ibl').setup {
        indent = {
          char = '│', -- Customize the indent line character
        },
        scope = {
          enabled = true, -- Enable the scope feature
          show_start = false, -- Highlight the start of scopes
          show_end = false, -- Optionally highlight the end of scopes
          highlight = { 'Function', 'Label' },
        },
        exclude = {
          filetypes = { 'help', 'dashboard', 'packer', 'NvimTree' }, -- Exclude certain filetypes
        },
      }
    end,
  },
}
