--                                  ╭─────────╮
--                                  │ Keymaps │
--                                  ╰─────────╯
-- 💥 Create key bindings that stick. WhichKey helps you remember
-- your Neovim keymaps, by showing available keybindings in a popup
-- as you type.

return {
  -- Plugins can also be configured to run Lua code when they are loaded.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'modern',
    delay = 100,
    win = {
      col = 0.5,
      width = 0.7,
    },
    plugins = {
      marks = false,
    },
    icons = {
      rules = false,
      notify = true,
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>d', group = '[D]ebug', icon = '' },
      { '<leader>g', group = '[G]it', icon = '󰊢' },
      { '<leader>t', group = '[T]oggle', icon = '' },
      { '<leader>m', group = '[M]essages', icon = '󰍢' },
      { '<leader>l', group = '[L]SP', icon = '' },
      { '<leader>s', group = '[S]earch Files', icon = '' },
      { '<leader>i', group = '[I]n Files', icon = '' },
      { '<leader>o', group = '[O]ther', icon = '󰘥' },

      -- Single Char
      {
        '<leader>c',
        name = '[C]hange Buffer',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>a',
        name = '[A]dd Buffer',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>f',
        name = '[F]ormat',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>q',
        name = '[Q]uit',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>Q',
        name = '[Q]uit Force',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>T',
        name = '[T]oggle Tag',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>u',
        name = '[U]ndo History',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>w',
        name = '[W]rite',
        icon = { icon = '', color = 'grey' },
      },
      {
        '<leader>W',
        name = '[W]rite and Quit',
        icon = { icon = '', color = 'grey' },
      },
    },
  },
}

-- <C + w> - Windows
-- <C + i/o> - Jumps
-- <S + k> - Documentation
-- g* - GOTO
-- z* - Window/View Manipulations
-- z= - Spelling
-- " - Clipboard
-- [ and ] - Move Between ...
-- * / # - Search Current Word Forward/Backward
