return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    {
      '<leader>ss',
      ':SessionSearch<CR>',
      mode = { 'n' },
      desc = '[S]essions',
      silent = true,
    },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    args_allow_files_auto_save = true,
  },
}
