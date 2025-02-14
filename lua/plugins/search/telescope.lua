--                                  ╭────────╮
--                                  │ Search │
--                                  ╰────────╯
-- Find, Filter, Preview, Pick. All lua, all the time.

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
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
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>oh', builtin.help_tags, { desc = '[H]elp' })
    vim.keymap.set('n', '<leader>ok', builtin.keymaps, { desc = '[K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
    vim.keymap.set(
      'n',
      '<leader>sy',
      ':Yazi<CR>',
      { desc = '[Y]azy', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>sp',
      ':Telescope projects<CR>',
      { desc = '[P]rojects', silent = true }
    )
    vim.keymap.set('n', '<leader>oa', builtin.builtin, { desc = '[A]nything' })
    vim.keymap.set(
      'n',
      '<leader>ig',
      builtin.live_grep,
      { desc = '[G]rep in Files' }
    )
    vim.keymap.set(
      'n',
      '<leader>ms',
      builtin.diagnostics,
      { desc = '[S]earch' }
    )
    vim.keymap.set('n', '<leader>or', builtin.resume, { desc = '[R]esume' })
    vim.keymap.set(
      'n',
      '<leader>mn',
      ':Noice telescope<CR>',
      { desc = '[N]otifications', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>s.',
      builtin.oldfiles,
      { desc = '[.] Recent Files' }
    )

    vim.keymap.set(
      'n',
      '<leader>w',
      ':w<CR>',
      { desc = '[W]rite', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>W',
      ':wq<CR>',
      { desc = '[W]rite and Quit', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>q',
      ':q<CR>',
      { desc = '[Q]uit', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>Q',
      ':q!<CR>',
      { desc = '[Q]uit Force', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>ot',
      ':Telescope colorscheme<CR>',
      { desc = '[T]heme', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>oc',
      ':Telescope neoclip<CR>',
      { desc = '[C]lipboard' }
    )
    vim.keymap.set(
      'n',
      '<leader>tl',
      ':Lazy<CR>',
      { desc = '[L]azy', silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>tm',
      ':Mason<CR>',
      { desc = '[M]ason', silent = true }
    )

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>ib', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        }
      )
    end, { desc = '[B]uffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>i/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[/] in Open Files' })

    vim.keymap.set('n', '<leader>sD', function()
      builtin.find_files { cwd = '~/.dotfiles/', hidden = true }
    end, { desc = '[D]otfiles' })

    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files { cwd = '/mnt/c/Denis/', hidden = true }
    end, { desc = '[C] Disk' })

    vim.keymap.set('n', '<leader>sd', function()
      builtin.find_files { cwd = '/mnt/d/Denis Samsung 870 EVO/', hidden = true }
    end, { desc = '[D] Disk' })

    vim.keymap.set('n', '<leader>sw', function()
      builtin.find_files { cwd = '~/', hidden = true }
    end, { desc = '[W]SL' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[N]eovim Files' })
  end,
}
