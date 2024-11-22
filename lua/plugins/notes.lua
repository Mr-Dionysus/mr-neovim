return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
  },

  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },

  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    init = function()
      require('telekasten').setup {
        home = vim.fn.expand '/mnt/c/Denis/Zettlekasten', -- Put the name of your notes directory here
      }
    end,
  },

  {
    'zk-org/zk-nvim',
    config = function()
      require('zk').setup {
        -- See Setup section below
      }
    end,
  },

  -- Your other plugins
  {
    'jakewvincent/mkdnflow.nvim',
    config = function()
      require('mkdnflow').setup {
        -- Config goes here; leave blank for defaults
      }
    end,
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/mnt/c/Denis/Zettlekasten',
        },
      },

      -- see below for full list of options 👇
    },
  },
}
