--                                   ╭──────╮
--                                   │ Help │
--                                   ╰──────╯

-- General help: `:help`
-- Options: `:help vim.opt`
-- Options' list: `:help option-list`
-- Lua's guide: `:help lua-guide`
-- Check errors: `:checkhealth`
-- Keymaps: `:help vim.keymap.set()`
-- Autocommands: `:help lua-guide-autocommands`

--                                ╭─────────────╮
--                                │ Vim Options │
--                                ╰─────────────╯

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
-- <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Needs for optimal visual
vim.opt.termguicolors = true

-- Nerd fonts
vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true

-- Relative numbers
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = 'a'

-- NeoVim's mode
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Break indent
vim.opt.breakindent = true

-- Undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn
vim.opt.signcolumn = 'yes'

-- Update time
vim.opt.updatetime = 250

-- Mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 100

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Spellfile
vim.opt.spellfile = 'en.utf-8.add'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

--                             ╭──────────────────╮
--                             │ Neovim's Keymaps │
--                             ╰──────────────────╯

vim.keymap.set('i', 'kj', '<Esc>', {})
vim.keymap.set('i', 'ло', '<Esc>', {})

-- Always center screen when using Ctrl + u/d in normal and visual modes
vim.api.nvim_set_keymap(
  'n',
  '<C-u>',
  '<C-u>zz',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  '<C-u>',
  '<C-u>zz',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-d>',
  '<C-d>zz',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  '<C-d>',
  '<C-d>zz',
  { noremap = true, silent = true }
)

-- Always center screen while searching via `n/N` in visual and normal modes
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'N', 'Nzz', { noremap = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut.
-- Otherwise, it's `<C-\><C-n>`
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)

--                             ╭──────────────────╮
--                             │   Autocommands   │
--                             ╰──────────────────╯

-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--                                   ╭──────╮
--                                   │ Lazy │
--                                   ╰──────╯
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  --[[THEMES]]
  { import = 'plugins/themes/tokyonight' },
  { import = 'plugins/themes/sonokai' },
  { import = 'plugins/themes/zephyr' },
  { import = 'plugins/themes/melange' },
  { import = 'plugins/themes/onedark' },
  { import = 'plugins/themes/gruvbox' },
  { import = 'plugins/themes/everforest' },
  { import = 'plugins/themes/catppuccin' },
  { import = 'plugins/themes/nightfox' },
  { import = 'plugins/themes/bamboo' },
  {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
    priority = 1000,
    init = function()
      ---- DARK THEMES ----
      -- vim.cmd.colorscheme 'dracula'
      -- vim.cmd.colorscheme 'sonokai'
      -- vim.cmd.colorscheme 'zephyr'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
      vim.cmd.colorscheme 'tokyonight-moon'
      --
      ---- LIGHT THEMES ----
      -- vim.o.background = 'light'
      --
      -- vim.cmd.colorscheme 'bamboo'
      -- vim.cmd.colorscheme 'dayfox'
      -- vim.cmd.colorscheme 'melange'
      -- vim.cmd.colorscheme 'onedark'
      -- vim.cmd.colorscheme 'gruvbox-material'
      -- vim.cmd.colorscheme 'everforest'

      require('dracula').setup {
        -- customize dracula color palette
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

  --[[WINDOWS]]
  { import = 'plugins/windows/focus' },
  { import = 'plugins/windows/auto_session' },
  { import = 'plugins/windows/project' },
  { import = 'plugins/windows/vim_tmux_navigator' },
  -- { import = 'plugins/windows/smart_splits' },

  --[[COMMENTS]]
  { import = 'plugins/comments/todo_comments' },
  {
    import = 'plugins/comments/comment_box',
  },
  { import = 'plugins/comments/comment' },
  { import = 'plugins/comments/ts_context_commentstring' },
  { import = 'plugins/comments/neoget' },
  { import = 'plugins/comments/mini_doc' },

  --[[CURSOR]]
  { import = 'plugins/cursor/visual_multi' },
  { import = 'plugins/cursor/tabout' },
  { import = 'plugins/cursor/modicator' },
  { import = 'plugins/cursor/illuminate' },

  --[[DEBUG]]
  { import = 'plugins/debug/dap' },
  { import = 'plugins/debug/tiny_inline_diagnostic' },
  { import = 'plugins/debug/dap_virtual_text' },
  { import = 'plugins/debug/gdb' },
  { import = 'plugins/debug/trouble' },
  { import = 'plugins/debug/actions_preview' },
  { import = 'plugins/debug/lightbulb' },

  --[[DESIGN]]
  { import = 'plugins/design/zen_mode' },
  { import = 'plugins/design/true_zen' },
  { import = 'plugins/design/noice' },
  { import = 'plugins/design/dressing' },
  { import = 'plugins/design/transparent' },
  { import = 'plugins/design/twilight' },
  { import = 'plugins/design/web_devicons' },
  { import = 'plugins/design/notify' },
  { import = 'plugins/design/indent_blankline' },

  --[[FILE MANAGERS]]
  { import = 'plugins/file_managers/neo_tree' },
  { import = 'plugins/file_managers/oil' },
  { import = 'plugins/file_managers/yazi' },
  { import = 'plugins/file_managers/mini_files' },

  --[[FORMAT]]
  { import = 'plugins/format/conform' },
  { import = 'plugins/format/treesj' },
  { import = 'plugins/format/refactoring' },

  --[[FRONTEND]]
  { import = 'plugins/frontend/tailwind_tools' },
  { import = 'plugins/frontend/ts_error_translator' },
  { import = 'plugins/frontend/tsc' },
  { import = 'plugins/frontend/typescript_tools' },
  { import = 'plugins/frontend/ccc' },
  { import = 'plugins/frontend/highlight_colors' },

  --[[TRAINING]]
  { import = 'plugins/training/vim_be_good' },
  { import = 'plugins/training/hardtime' },
  { import = 'plugins/training/competitest' },
  { import = 'plugins/training/leetcode' },

  --[[GIT]]
  { import = 'plugins/git/gitsigns' },
  { import = 'plugins/git/neogit' },
  { import = 'plugins/git/diffview' },
  { import = 'plugins/git/lazygit' },
  { import = 'plugins/git/git_conflict' },
  { import = 'plugins/git/octo' },
  { import = 'plugins/git/mini_git' },

  --[[IMAGES]]
  { import = 'plugins/images/codesnap' },

  --[[KEYMAPS]]
  { import = 'plugins/keymaps/which_key' },
  { import = 'plugins/keymaps/legendary' },
  { import = 'plugins/keymaps/better_escape' },

  --[[LSP]]
  { import = 'plugins/lsp/lint' },
  { import = 'plugins/lsp/lazydev' },
  { import = 'plugins/lsp/luvit_meta' },
  { import = 'plugins/lsp/lspconfig' },
  { import = 'plugins/lsp/cmp' },
  { import = 'plugins/lsp/java' },
  { import = 'plugins/lsp/lsp_signature' },
  { import = 'plugins/lsp/lspkind' },
  { import = 'plugins/lsp/goto_preview' },
  { import = 'plugins/lsp/otter' },
  -- { import = 'plugins/lsp/jdtls' },

  -- [[MARKS]]
  { import = 'plugins/marks/marks' },
  { import = 'plugins/marks/grapple' },
  -- { import = 'plugins/marks/harpoon' },

  --[[MOTIONS]]
  { import = 'plugins/motions/hop' },
  { import = 'plugins/motions/treehopper' },
  { import = 'plugins/motions/treesitter_textobjects' },
  { import = 'plugins/motions/mini_bracketed' },
  { import = 'plugins/motions/various_textobjs' },
  -- { import = 'plugins/motions/leap' },
  -- { import = 'plugins/motions/flash' },

  --[[NOTES]]
  { import = 'plugins/notes/neorg' },
  { import = 'plugins/notes/orgmode' },
  { import = 'plugins/notes/telekasten' },
  { import = 'plugins/notes/zk' },
  { import = 'plugins/notes/mkdnflow' },
  { import = 'plugins/notes/obsidian' },

  --[[REMOTE]]
  -- { import = 'plugins/remote/distant' },
  -- { import = 'plugins/remote/netman' },
  -- { import = 'plugins/remote/remote_containers' },

  --[[SEARCH]]
  { import = 'plugins/search/telescope' },
  { import = 'plugins/search/bqf' },
  { import = 'plugins/search/other' },
  { import = 'plugins/search/telescope_undo' },
  { import = 'plugins/search/neoclip' },
  { import = 'plugins/search/hlslens' },
  { import = 'plugins/search/spectre' },
  { import = 'plugins/search/yanky' },
  { import = 'plugins/search/ssr' },
  { import = 'plugins/search/aerial' },
  { import = 'plugins/search/inc_rename' },

  --[[SNIPPETS]]
  { import = 'plugins/snippets/luasnip' },
  { import = 'plugins/snippets/friendly_snippets' },
  -- { import = 'plugins/snippets/scissors' },

  --[[STARTUP]]
  { import = 'plugins/startup/dashboard' },
  -- { import = 'plugins/startup/alpha' },

  --[[STATUS LINES]]
  { import = 'plugins/status_lines/lualine' },
  { import = 'plugins/status_lines/navic' },
  { import = 'plugins/status_lines/barbecue' },

  --[[SYNTAX]]
  { import = 'plugins/syntax/treesitter' },
  { import = 'plugins/syntax/surround' },
  { import = 'plugins/syntax/scrollview' },
  { import = 'plugins/syntax/autopairs' },
  { import = 'plugins/syntax/ts_autotag' },
  { import = 'plugins/syntax/ufo' },
  { import = 'plugins/syntax/promise_async' },
  { import = 'plugins/syntax/rainbow_delimiters' },

  --[[TERMINAL]]
  { import = 'plugins/terminal/toggleterm' },
  { import = 'plugins/terminal/flatten' },

  --[[TESTS]]
  { import = 'plugins/tests/neotest' },
  { import = 'plugins/tests/sniprun' },
  { import = 'plugins/tests/iron' },
  { import = 'plugins/tests/compiler' },
  { import = 'plugins/tests/overseer' },
  { import = 'plugins/tests/molten' },

  --[[UTILS]]
  { import = 'plugins/utils/mini_ai' },
  { import = 'plugins/utils/nui' },
  { import = 'plugins/utils/dial' },
  { import = 'plugins/utils/package_info' },
  { import = 'plugins/utils/neocomposer' },
  { import = 'plugins/utils/kulala' },
  { import = 'plugins/utils/rest' },
  { import = 'plugins/utils/render_markdown' },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
