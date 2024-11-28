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
--                              ╭────────────────╮
--                              │ Plugin Manager │
--                              ╰────────────────╯
-- 💤 A modern plugin manager for Neovim.
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
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
  --                                  ╭────────╮
  --                                  │ Themes │
  --                                  ╰────────╯
  { import = 'plugins/themes/sonokai' },
  { import = 'plugins/themes/catppuccin' },
  {
    'Mofiqul/dracula.nvim',
    name = 'dracula',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'dracula'
      -- vim.cmd.colorscheme 'sonokai'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'

      local dracula = require 'dracula'
      dracula.setup {
        -- customize dracula color palette
        colors = {
          bg = '#282A36',
          fg = '#F8F8F2',
          selection = '#44475A',
          comment = '#6272A4',
          red = '#FF5555',
          orange = '#FFB86C',
          yellow = '#F1FA8C',
          green = '#50fa7b',
          purple = '#BD93F9',
          cyan = '#8BE9FD',
          pink = '#FF79C6',
          bright_red = '#FF6E6E',
          bright_green = '#69FF94',
          bright_yellow = '#FFFFA5',
          bright_blue = '#D6ACFF',
          bright_magenta = '#FF92DF',
          bright_cyan = '#A4FFFF',
          bright_white = '#FFFFFF',
          menu = '#21222C',
          visual = '#3E4452',
          gutter_fg = '#4B5263',
          nontext = '#3B4048',
          white = '#ABB2BF',
          black = '#191A21',
        },
        -- show the '~' characters after the end of buffers
        show_end_of_buffer = true, -- default false
        -- use transparent background
        transparent_bg = false, -- default false
        -- set custom lualine background color
        lualine_bg_color = '#44475a', -- default nil
        -- set italic comment
        italic_comment = false, -- default false
        -- overrides the default highlights with table see `:h synIDattr`
        overrides = {},
        -- You can use overrides as table like this
        -- overrides = {
        --   NonText = { fg = "white" }, -- set NonText fg to white
        --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        --   Nothing = {} -- clear highlight of Nothing
        -- },
        -- Or you can also use it like a function to get color from theme
        -- overrides = function (colors)
        --   return {
        --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
        --   }
        -- end,
      }
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  --                                  ╭─────────╮
  --                                  │ Windows │
  --                                  ╰─────────╯
  -- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua.
  -- A full suite of window management enhancements. Vim splits on steroids!
  { import = 'plugins/windows/focus' },

  -- A small automated session manager for Neovim.
  { import = 'plugins/windows/auto_session' },

  -- The superior project management solution for neovim.
  { import = 'plugins/windows/project' },

  -- Seamless navigation between tmux panes and vim splits
  { import = 'plugins/windows/vim_tmux_navigator' },

  -- Smart, seamless, directional navigation and resizing of Neovim +
  -- terminal multiplexer splits. Supports tmux, Wezterm, and Kitty.
  -- Think about splits in terms of "up/down/left/right"
  -- { import = 'plugins/windows/smart_splits' },
  --                                 ╭──────────╮
  --                                 │ Comments │
  --                                 ╰──────────╯
  -- ✅ Highlight, list and search todo comments in your projects.
  { import = 'plugins/comments/todo_comments' },

  -- ✨ Clarify and beautify your comments and plain text files using boxes
  -- and lines.
  {
    import = 'plugins/comments/comment_box',
  },

  -- 🧠 💪 // Smart and powerful comment plugin for neovim.
  -- Supports treesitter, dot repeat, left-right/up-down motions,
  -- hooks, and more.
  { import = 'plugins/comments/comment' },

  -- Neovim treesitter plugin for setting the commentstring based
  -- on the cursor location in a file.
  { import = 'plugins/comments/ts_context_commentstring' },

  -- A better annotation generator. Supports multiple languages
  -- and annotation conventions.
  { import = 'plugins/comments/neogen' },

  -- Documentation generator.
  { import = 'plugins/comments/mini_doc' },
  --                                  ╭────────╮
  --                                  │ Cursor │
  --                                  ╰────────╯
  -- Multiple cursors plugin for Vim/Neovim.
  { import = 'plugins/cursor/visual_multi' },

  -- Supercharge your workflow and start tabbing out
  -- from parentheses, quotes, and similar contexts today.
  { import = 'plugins/cursor/tabout' },

  -- Cursor line number mode indicator plugin for Neovim.
  { import = 'plugins/cursor/modicator' },

  -- (Neo)Vim plugin for automatically highlighting other
  -- uses of the word under the cursor using either LSP,
  -- Tree-sitter, or regex matching.
  { import = 'plugins/cursor/illuminate' },
  --                                   ╭───────╮
  --                                   │ Debug │
  --                                   ╰───────╯
  -- Debug Adapter Protocol client implementation for Neovim.
  { import = 'plugins/debug/dap' },

  -- A Neovim plugin that display prettier diagnostic messages.
  -- Display diagnostic messages where the cursor is, with icons
  -- and colors.
  { import = 'plugins/debug/tiny_inline_diagnostic' },

  -- This plugin adds virtual text support to nvim-dap.
  -- nvim-treesitter is used to find variable definitions.
  { import = 'plugins/debug/dap_virtual_text' },

  -- Neovim thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB.
  { import = 'plugins/debug/gdb' },

  -- 🚦 A pretty diagnostics, references, telescope results,
  -- quickfix and location list to help you solve all the
  -- trouble your code is causing.
  { import = 'plugins/debug/trouble' },

  -- Fully customizable previewer for LSP code actions.
  { import = 'plugins/debug/actions_preview' },

  -- VSCode 💡 for neovim's built-in LSP.
  { import = 'plugins/debug/lightbulb' },
  --                                  ╭────────╮
  --                                  │ Design │
  --                                  ╰────────╯
  -- Distraction-free coding for Neovim.
  { import = 'plugins/design/zen_mode' },

  -- 🦝 Clean and elegant distraction-free writing for NeoVim.
  { import = 'plugins/design/true_zen' },

  -- 💥 Highly experimental plugin that completely replaces
  -- the UI for messages, cmdline and the popupmenu.
  { import = 'plugins/design/noice' },

  --  Neovim plugin to improve the default vim.ui interfaces.
  { import = 'plugins/design/dressing' },

  -- Remove all background colors to make nvim transparent.
  { import = 'plugins/design/transparent' },

  -- 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims
  -- inactive portions of the code you're editing using TreeSitter.
  { import = 'plugins/design/twilight' },

  -- Lua fork of vim-web-devicons for Neovim.
  { import = 'plugins/design/web_devicons' },

  -- A fancy, configurable, notification manager for NeoVim.
  { import = 'plugins/design/notify' },

  -- This plugin adds indentation guides to Neovim. It uses
  -- Neovim's virtual text feature and no conceal.
  { import = 'plugins/design/indent_blankline' },
  --                               ╭───────────────╮
  --                               │ File Managers │
  --                               ╰───────────────╯
  -- Neovim plugin to manage the file system and other tree
  -- like structures.
  { import = 'plugins/file_managers/neo_tree' },

  -- Neovim file explorer: edit your filesystem like a buffer.
  { import = 'plugins/file_managers/oil' },

  -- A Neovim Plugin for the yazi terminal file manager.
  { import = 'plugins/file_managers/yazi' },

  -- Mini popup with folders and files.
  { import = 'plugins/file_managers/mini_files' },
  --                                  ╭────────╮
  --                                  │ Format │
  --                                  ╰────────╯
  -- Lightweight yet powerful formatter plugin for Neovim.
  { import = 'plugins/format/conform' },

  -- Neovim plugin for splitting/joining blocks of code.
  { import = 'plugins/format/treesj' },

  -- The Refactoring library based off the Refactoring book
  -- by Martin Fowler.
  { import = 'plugins/format/refactoring' },
  --                                 ╭──────────╮
  --                                 │ Frontend │
  --                                 ╰──────────╯
  -- An unofficial Tailwind CSS integration and tooling for
  -- Neovim.
  { import = 'plugins/frontend/tailwind_tools' },

  -- 🌈 A Neovim plugin to add vscode-style TailwindCSS completion
  -- to nvim-cmp.
  { import = 'plugins/frontend/tailwindcss_colorizer_cmp' },

  -- A Neovim port of Matt Pocock's ts-error-translator for
  -- VSCode for turning messy and confusing TypeScript errors
  -- into plain English.
  { import = 'plugins/frontend/ts_error_translator' },

  -- A Neovim plugin for seamless, asynchronous project-wide
  -- TypeScript type-checking using the TypeScript compiler (tsc).
  { import = 'plugins/frontend/tsc' },

  -- ⚡ TypeScript integration NeoVim deserves ⚡.
  { import = 'plugins/frontend/typescript_tools' },

  -- Color picker and highlighter plugin for Neovim.
  { import = 'plugins/frontend/ccc' },

  -- Highlight colors for Neovim.
  { import = 'plugins/frontend/highlight_colors' },
  --                                 ╭──────────╮
  --                                 │ Training │
  --                                 ╰──────────╯
  -- vim-be-good is a nvim plugin designed to make you better
  -- at Vim Movements.
  { import = 'plugins/training/vim_be_good' },

  -- Establish good command workflow and quit bad habit.
  { import = 'plugins/training/hardtime' },

  -- CompetiTest.nvim is a Neovim plugin for Competitive
  -- Programming: it can manage and check testcases, download
  -- problems and contests from online judges and much more.
  { import = 'plugins/training/competitest' },

  -- A Neovim plugin enabling you to solve LeetCode problems.
  { import = 'plugins/training/leetcode' },
  --                                    ╭─────╮
  --                                    │ Git │
  --                                    ╰─────╯
  -- Super fast git decorations implemented purely in Lua.
  { import = 'plugins/git/gitsigns' },

  -- An interactive and powerful Git interface for Neovim,
  -- inspired by Magit.
  { import = 'plugins/git/neogit' },

  -- Single tabpage interface for easily cycling through
  -- diffs for all modified files for any git rev.
  { import = 'plugins/git/diffview' },

  -- Plugin for calling lazygit from within Neovim.
  { import = 'plugins/git/lazygit' },

  -- A plugin to visualise and resolve merge conflicts in Neovim.
  { import = 'plugins/git/git_conflict' },

  -- Edit and review GitHub issues and pull requests from the
  -- comfort of your favorite editor.
  { import = 'plugins/git/octo' },

  -- Git commands inside Neovim.
  { import = 'plugins/git/mini_git' },
  --                                  ╭────────╮
  --                                  │ Images │
  --                                  ╰────────╯
  -- 📸 Snapshot plugin with rich features that can make
  -- pretty code snapshots for Neovim.
  { import = 'plugins/images/codesnap' },

  -- 🖼️ Bringing images to Neovim.
  -- { import = 'plugins/images/image' },

  -- Effortlessly embed images into any markup language,
  -- like LaTeX, Markdown or Typst.
  -- { import = 'plugins/images/img-clip' },
  --                                  ╭─────────╮
  --                                  │ Keymaps │
  --                                  ╰─────────╯
  -- 💥 Create key bindings that stick. WhichKey helps you
  -- remember your Neovim keymaps, by showing available
  -- keybindings in a popup as you type.
  { import = 'plugins/keymaps/which_key' },

  -- 🗺️ A legend for your keymaps, commands, and autocmds,
  -- integrates with which-key.nvim, lazy.nvim, and more.
  { import = 'plugins/keymaps/legendary' },

  -- Map keys without delay when typing.
  { import = 'plugins/keymaps/better_escape' },
  --                                    ╭─────╮
  --                                    │ LSP │
  --                                    ╰─────╯
  -- An asynchronous linter plugin for Neovim complementary
  -- to the built-in Language Server Protocol support.
  { import = 'plugins/lsp/lint' },

  -- Faster LuaLS setup for Neovim
  { import = 'plugins/lsp/lazydev' },

  -- Meta type definitions for the Lua platform Luvit.
  { import = 'plugins/lsp/luvit_meta' },

  -- Quickstart configs for Nvim LSP.
  { import = 'plugins/lsp/lspconfig' },

  -- A completion plugin for neovim coded in Lua.
  { import = 'plugins/lsp/cmp' },

  -- Painless Java in Neovim.
  { import = 'plugins/lsp/java' },

  -- LSP signature hint as you type.
  { import = 'plugins/lsp/lsp_signature' },

  -- vscode-like pictograms for neovim lsp completion items.
  { import = 'plugins/lsp/lspkind' },

  -- A small Neovim plugin for previewing definitions using
  -- floating windows.
  { import = 'plugins/lsp/goto_preview' },

  -- Just ask an otter! 🦦.
  { import = 'plugins/lsp/otter' },

  -- Extensions for the built-in LSP support in Neovim for
  -- eclipse.jdt.ls.
  -- { import = 'plugins/lsp/jdtls' },
  --                                   ╭───────╮
  --                                   │ Marks │
  --                                   ╰───────╯
  -- A better user experience for viewing and interacting
  -- with Vim marks.
  { import = 'plugins/marks/marks' },

  -- Neovim plugin for tagging important files.
  { import = 'plugins/marks/grapple' },

  -- Pin files and switch between them with ease.
  -- { import = 'plugins/marks/harpoon' },
  --                                  ╭─────────╮
  --                                  │ Motions │
  --                                  ╰─────────╯
  -- Hop is an EasyMotion-like plugin allowing you to jump
  -- anywhere in a document with as few keystrokes as possible.
  { import = 'plugins/motions/hop' },

  -- A Plugin that provides region selection using hints on
  -- the abstract syntax tree of a document.
  { import = 'plugins/motions/treehopper' },

  -- Syntax aware text-objects, select, move, swap, and peek support.
  { import = 'plugins/motions/treesitter_textobjects' },

  -- Go forward/backward with square brackets.
  { import = 'plugins/motions/mini_bracketed' },

  -- Bundle of more than 30 new textobjects for Neovim.
  { import = 'plugins/motions/various_textobjs' },

  -- Leap is a general-purpose motion plugin for Neovim,
  -- building and improving primarily on vim-sneak, with
  -- the ultimate goal of establishing a new standard
  -- interface for moving around in the visible area in
  -- Vim-like modal editors.
  -- { import = 'plugins/motions/leap' },

  -- Navigate your code with search labels, enhanced
  -- character motions and Treesitter integration
  -- { import = 'plugins/motions/flash' },
  --                                   ╭───────╮
  --                                   │ Notes │
  --                                   ╰───────╯
  -- Modernity meets insane extensibility. The future
  -- of organizing your life in Neovim.
  { import = 'plugins/notes/neorg' },

  -- Orgmode clone written in Lua for Neovim 0.9+.
  { import = 'plugins/notes/orgmode' },

  -- A Neovim (lua) plugin for working with a markdown
  -- zettelkasten / wiki and mixing it with a journal,
  -- based on telescope.nvim.
  { import = 'plugins/notes/telekasten' },

  -- Neovim extension for zk.
  { import = 'plugins/notes/zk' },

  -- Fluent navigation and management of markdown notebooks.
  { import = 'plugins/notes/mkdnflow' },

  -- Obsidian 🤝 Neovim.
  { import = 'plugins/notes/obsidian' },
  --                                  ╭────────╮
  --                                  │ Remote │
  --                                  ╰────────╯
  -- 🚧 (Alpha stage software) Edit files, run programs,
  -- and work with LSP on a remote machine from the comfort
  -- of your local environment 🚧.
  -- { import = 'plugins/remote/distant' },

  -- Neovim (Lua powered) Network Resource Manager.
  -- { import = 'plugins/remote/netman' },

  --Develop inside docker containers, just like VSCode.
  -- { import = 'plugins/remote/remote_containers' },
  --                                  ╭────────╮
  --                                  │ Search │
  --                                  ╰────────╯
  -- Find, Filter, Preview, Pick. All lua, all the time.
  { import = 'plugins/search/telescope' },

  -- Better quickfix window in Neovim, polish old quickfix
  -- window.
  { import = 'plugins/search/bqf' },

  -- Open alternative files for the current buffer.
  { import = 'plugins/search/other' },

  -- A telescope extension to view and search your undo
  -- tree 🌴.
  { import = 'plugins/search/telescope_undo' },

  -- Clipboard manager neovim plugin with telescope integration.
  { import = 'plugins/search/neoclip' },

  -- Hlsearch Lens for Neovim.
  { import = 'plugins/search/hlslens' },

  -- Find the enemy and replace them with dark power.
  { import = 'plugins/search/spectre' },

  -- Improved Yank and Put functionalities for Neovim.
  { import = 'plugins/search/yanky' },

  -- Treesitter based structural search and replace plugin
  -- for Neovim.
  { import = 'plugins/search/ssr' },

  -- Neovim plugin for a code outline window.
  { import = 'plugins/search/aerial' },

  -- Incremental LSP renaming based on Neovim's
  -- command-preview feature.
  { import = 'plugins/search/inc_rename' },
  --                                 ╭──────────╮
  --                                 │ Snippets │
  --                                 ╰──────────╯
  -- Snippet Engine for Neovim written in Lua.
  { import = 'plugins/snippets/luasnip' },

  -- Set of preconfigured snippets for different languages.
  { import = 'plugins/snippets/friendly_snippets' },

  -- Automagical editing and creation of snippets.
  -- { import = 'plugins/snippets/scissors' },
  --                                 ╭───────────╮
  --                                 │ Dashboard │
  --                                 ╰───────────╯
  -- Vim dashboard.
  { import = 'plugins/dashboards/dashboard' },

  -- A highly configurable neovim startup screen.
  -- { import = 'plugins/dashboards/alpha' },

  -- A highly configurable neovim startup screen
  -- { import = 'plugins/dashboards/startup' },
  --                               ╭──────────────╮
  --                               │ Status Lines │
  --                               ╰──────────────╯
  -- A blazing fast and easy to configure neovim statusline
  -- plugin written in pure lua.
  { import = 'plugins/status_lines/lualine' },

  -- Simple winbar/statusline plugin that shows your current
  -- code context.
  { import = 'plugins/status_lines/navic' },

  -- Visual Studio Code inspired breadcrumbs plugin for the
  -- Neovim editor.
  { import = 'plugins/status_lines/barbecue' },
  --                                  ╭────────╮
  --                                  │ Syntax │
  --                                  ╰────────╯
  -- Nvim Treesitter configurations and abstraction layer.
  { import = 'plugins/syntax/treesitter' },

  -- Add/change/delete surrounding delimiter pairs with ease.
  -- Written with ❤️ in Lua.
  { import = 'plugins/syntax/surround' },

  -- A Neovim plugin that displays interactive vertical
  -- scrollbars and signs.
  { import = 'plugins/syntax/scrollview' },

  -- Autopairs for neovim written in lua.
  { import = 'plugins/syntax/autopairs' },

  -- Use treesitter to autoclose and autorename html tag.
  { import = 'plugins/syntax/ts_autotag' },

  -- The goal of nvim-ufo is to make Neovim's fold look
  -- modern and keep high performance.
  { import = 'plugins/syntax/ufo' },

  -- The goal of promise-async is to port Promise & Async
  -- from JavaScript to Lua.
  { import = 'plugins/syntax/promise_async' },

  -- Rainbow delimiters for Neovim with Tree-sitter.
  { import = 'plugins/syntax/rainbow_delimiters' },
  --                                 ╭──────────╮
  --                                 │ Termianl │
  --                                 ╰──────────╯
  -- A neovim lua plugin to help easily manage multiple
  -- terminal windows.
  { import = 'plugins/terminal/toggleterm' },

  -- Open files and command output from wezterm, kitty,
  -- and neovim terminals in your current neovim instance.
  { import = 'plugins/terminal/flatten' },
  --                                   ╭───────╮
  --                                   │ Tests │
  --                                   ╰───────╯
  -- An extensible framework for interacting with tests
  -- within NeoVim.
  { import = 'plugins/tests/neotest' },

  -- A Neovim plugin to run lines/blocs of code (independently
  -- of the rest of the file), supporting multiples languages.
  { import = 'plugins/tests/sniprun' },

  -- Interactive Repl Over Neovim.
  { import = 'plugins/tests/iron' },

  -- Neovim compiler for building and running your code
  -- without having to configure anything.
  { import = 'plugins/tests/compiler' },

  -- A task runner and job management plugin for Neovim.
  { import = 'plugins/tests/overseer' },

  -- A neovim plugin for interactively running code with
  -- the jupyter kernel. Fork of magma-nvim with improvements
  -- in image rendering, performance, and more.
  -- { import = 'plugins/tests/molten' },
  --                                   ╭───────╮
  --                                   │ Utils │
  --                                   ╰───────╯
  -- Ecnhances a/i textobjects
  { import = 'plugins/utils/mini_ai' },

  -- UI Component Library for Neovim.
  { import = 'plugins/utils/nui' },

  -- Enhanced increment/decrement plugin for Neovim.
  { import = 'plugins/utils/dial' },

  -- ✍️ All the npm/yarn/pnpm commands I don't want to type.
  { import = 'plugins/utils/package_info' },

  -- Neovim plugin that simplifies macros, enhancing
  -- productivity with harmony.
  { import = 'plugins/utils/neocomposer' },

  -- A minimal 🤏 HTTP-client 🐼 interface 🖥️ for Neovim ❤️..
  { import = 'plugins/utils/kulala' },

  -- A very fast, powerful, extensible and asynchronous
  -- Neovim HTTP client written in Lua.
  { import = 'plugins/utils/rest' },

  -- Plugin to improve viewing Markdown files in Neovim.
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
