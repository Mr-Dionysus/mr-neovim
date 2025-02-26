--                               ╭──────────────╮
--                               │ File Manager │
--                               ╰──────────────╯
-- Mini popup with folders and files.
return {
  'echasnovski/mini.files',
  keys = {
    {
      '<leader>se',
      ':lua MiniFiles.open()<CR>',
      mode = { '' },
      desc = '[E]xplorer',
      silent = true,
    },
  },
  version = false,
  init = function()
    require('mini.files').setup()
  end,
}
