--                            ╭─────────────────────╮
--                            │ File Manager (Yazi) │
--                            ╰─────────────────────╯
-- A Neovim Plugin for the yazi terminal file manager.
return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    {
      -- Open in the current working directory
      '<leader>sh',
      '<cmd>Yazi cwd<cr>',
      desc = '[H]ere via Yazi',
    },
    {
      '<leader>sy',
      ':Yazi<CR>',
      mode = { 'n' },
      desc = '[Y]azi',
      silent = true,
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<c-up>',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = '?',
    },
  },
}
