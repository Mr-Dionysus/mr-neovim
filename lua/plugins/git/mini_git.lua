return {
  'echasnovski/mini-git',
  version = false,
  main = 'mini.git',

  init = function()
    require('mini.git').setup()
  end,
}
