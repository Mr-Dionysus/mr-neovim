--                            ╭────────────────────╮
--                            │ Debug Virtual Text │
--                            ╰────────────────────╯
-- This plugin adds virtual text support to nvim-dap.
-- nvim-treesitter is used to find variable definitions.
return {
  'theHamsta/nvim-dap-virtual-text',
  init = function()
    require('nvim-dap-virtual-text').setup()
  end,
}
