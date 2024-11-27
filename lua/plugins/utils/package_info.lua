return {
  'vuki656/package-info.nvim',
  requires = 'MunifTanjim/nui.nvim',
  init = function()
    require('package-info').setup()
  end,
}
