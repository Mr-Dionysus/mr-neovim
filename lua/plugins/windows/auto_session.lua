return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    args_allow_files_auto_save = true,
  },
  init = function()
    vim.keymap.set(
      'n',
      '<leader>ss',
      ':SessionSearch<CR>',
      { desc = '[S]essions', silent = true }
    )
  end,
}
