--                                  ╭────────╮
--                                  │ Search │
--                                  ╰────────╯
-- Find, Filter, Preview, Pick. All lua, all the time.
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  keys = {
    {
      '<leader>oh',
      require('telescope.builtin').help_tags,
      mode = { 'n' },
      desc = '[H]elp',
    },
    {
      '<leader>ok',
      require('telescope.builtin').keymaps,
      mode = { 'n' },
      desc = '[K]eymaps',
    },
    {
      '<leader>sf',
      require('telescope.builtin').find_files,
      mode = { 'n' },
      desc = '[F]iles',
    },
    {
      '<leader>sp',
      ':Telescope projects<CR>',
      mode = { 'n' },
      desc = '[P]rojects',
      silent = true,
    },
    {
      '<leader>oa',
      require('telescope.builtin').builtin,
      mode = { 'n' },
      desc = '[A]nything',
    },
    {
      '<leader>ig',
      require('telescope.builtin').live_grep,
      mode = { 'n' },
      desc = '[G]rep in Files',
    },
    {
      '<leader>ms',
      require('telescope.builtin').diagnostics,
      mode = { 'n' },
      desc = '[S]earch',
    },
    {
      '<leader>or',
      require('telescope.builtin').resume,
      mode = { 'n' },
      desc = '[R]esume',
    },
    {
      '<leader>mn',
      ':Noice telescope<CR>',
      mode = { 'n' },
      desc = '[N]otifications',
      silent = true,
    },
    {
      '<leader>s.',
      require('telescope.builtin').oldfiles,
      mode = { 'n' },
      desc = '[.] Recent Files',
    },
    {
      '<leader>ot',
      ':Telescope colorscheme<CR>',
      mode = { 'n' },
      desc = '[T]heme',
      silent = true,
    },
    {
      '<leader>oc',
      ':Telescope neoclip<CR>',
      mode = { 'n' },
      desc = '[C]lipboard',
    },
    -- Slightly advanced example of overriding default behavior and theme
    {
      '<leader>ib',
      function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          }
        )
      end,
      mode = { 'n' },
      desc = '[B]uffer',
    },
    {
      '<leader>sD',
      function()
        require('telescope.builtin').find_files {
          cwd = '~/.dotfiles/',
          hidden = true,
        }
      end,
      mode = { 'n' },
      desc = '[D]otfiles',
    },
    {
      '<leader>sc',
      function()
        require('telescope.builtin').find_files {
          cwd = '/mnt/c/Denis/',
          hidden = true,
        }
      end,
      mode = { 'n' },
      desc = '[C] Disk',
    },
    {
      '<leader>sd',
      function()
        require('telescope.builtin').find_files {
          cwd = '/mnt/d/Denis Samsung 870 EVO/',
          hidden = true,
        }
      end,
      mode = { 'n' },
      desc = '[D] Disk',
    },
    {
      '<leader>sl',
      function()
        require('telescope.builtin').find_files { cwd = '~/', hidden = true }
      end,
      mode = { 'n' },
      desc = '[L]inux',
    },
    -- Shortcut for searching your Neovim configuration files
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      mode = { 'n' },
      desc = '[N]eovim Files',
    },
  },
  -- See `:help telescope.builtin`
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `setup_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.help()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.help()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },

      -- Show Hidden Files
      -- pickers = {
      --   find_files = {
      --     hidden = true,
      --   },
      -- },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
