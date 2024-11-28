--                               ╭──────────────╮
--                               │ File Manager │
--                               ╰──────────────╯
-- Mini popup with folders and files.

return {
  'echasnovski/mini.files',
  version = false,
  init = function()
    require('mini.files').setup()
  end,
  config = function()
    vim.keymap.set(
      '',
      '<leader>tf',
      ':lua MiniFiles.open()<CR>',
      { desc = '[T]oggle [F]ile Manager' }
    )
  end,
}
