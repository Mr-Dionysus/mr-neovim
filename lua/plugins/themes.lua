---- THEMES ----

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- peFuzzyCommandSearch)
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      ---- DARK THEMES ----
      -- vim.cmd.colorscheme 'dracula'
      -- vim.cmd.colorscheme 'sonokai'
      -- vim.cmd.colorscheme 'zephyr'
      vim.cmd.colorscheme 'cyberdream'
      -- vim.cmd.colorscheme 'oxocarbon'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
      -- vim.cmd.colorscheme 'tokyonight-moon'
      --
      ---- LIGHT THEMES ----
      -- vim.o.background = 'light'
      --
      -- vim.cmd.colorscheme 'bamboo'
      -- vim.cmd.colorscheme 'dayfox'
      -- vim.cmd.colorscheme 'tokyonight-day'
      -- vim.cmd.colorscheme 'melange'
      -- vim.cmd.colorscheme 'onedark'
      -- vim.cmd.colorscheme 'onelight'
      -- vim.cmd.colorscheme 'gruvbox-material'
      -- vim.cmd.colorscheme 'everforest'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {

    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.

    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
    priority = 1000,
    init = function()
      require('dracula').setup {
        -- -- customize dracula color palette
        -- colors = {
        --   bg = '#282A36',
        --   fg = '#F8F8F2',
        --   selection = '#44475A',
        --   comment = '#6272A4',
        --   red = '#FF5555',
        --   orange = '#FFB86C',
        --   yellow = '#F1FA8C',
        --   green = '#50fa7b',
        --   purple = '#BD93F9',
        --   cyan = '#8BE9FD',
        --   pink = '#FF79C6',
        --   bright_red = '#FF6E6E',
        --   bright_green = '#69FF94',
        --   bright_yellow = '#FFFFA5',
        --   bright_blue = '#D6ACFF',
        --   bright_magenta = '#FF92DF',
        --   bright_cyan = '#A4FFFF',
        --   bright_white = '#FFFFFF',
        --   menu = '#21222C',
        --   visual = '#3E4452',
        --   gutter_fg = '#4B5263',
        --   nontext = '#3B4048',
        --   white = '#ABB2BF',
        --   black = '#191A21',
        -- },
        -- -- show the '~' characters after the end of buffers
        -- show_end_of_buffer = true, -- default false
        -- -- use transparent background
        -- transparent_bg = false, -- default false
        -- -- set custom lualine background color
        -- lualine_bg_color = '#44475a', -- default nil
        -- -- set italic comment
        -- italic_comment = true, -- default false
        -- -- overrides the default highlights with table see `:h synIDattr`
        -- overrides = {},
        -- -- You can use overrides as table like this
        -- -- overrides = {
        -- --   NonText = { fg = "white" }, -- set NonText fg to white
        -- --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        -- --   Nothing = {} -- clear highlight of Nothing
        -- -- },
        -- -- Or you can also use it like a function to get color from theme
        -- -- overrides = function (colors)
        -- --   return {
        -- --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
        -- --   }
        -- -- end,
      }
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'sainnhe/sonokai',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'nvimdev/zephyr-nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'savq/melange-nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'navarasu/onedark.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    --[[
    init = function()
      require('onedark').setup {
        -- Your posted configuration
        style = 'light',
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      }
      require('onedark').load()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
    ]]
  },

  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'sainnhe/gruvbox-material',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'sainnhe/everforest',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'EdenEast/nightfox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'ribru17/bamboo.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      --[[
      require('bamboo').setup {
        -- Main options --
        -- NOTE: to use the light theme, set `vim.o.background = 'light'`
        style = 'light', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
        toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
        transparent = false, -- Show/hide background
        dim_inactive = false, -- Dim inactive windows/buffers
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- Change code style ---
        -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
        -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
        code_style = {
          comments = { italic = true },
          conditionals = { italic = true },
          keywords = {},
          functions = {},
          namespaces = { italic = true },
          parameters = { italic = true },
          strings = {},
          variables = {},
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = false, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }
      ]]
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
