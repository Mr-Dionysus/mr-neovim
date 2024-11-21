return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },

  {
    'ahmedkhalf/project.nvim',
    init = function()
      require('project_nvim').setup {
        require('telescope').load_extension 'projects',
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- lua
        --   require('nvim-tree').setup {
        --     sync_root_with_cwd = true,
        --     respect_buf_cwd = true,
        --     update_focused_file = {
        --       enable = true,
        --       update_root = true,
        --     },
        --   },
      }
    end,
  },

  {
    {
      'nvim-focus/focus.nvim',
      version = false,
      init = function()
        require('focus').setup()
      end,
    },
  },

  -- { 'mrjones2014/smart-splits.nvim' },
}
