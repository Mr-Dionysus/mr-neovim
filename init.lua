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
  { import = 'plugins' },
  --
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
