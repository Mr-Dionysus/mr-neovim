--                                ╭─────────────╮
--                                │ Breadcrumbs │
--                                ╰─────────────╯
-- Visual Studio Code inspired breadcrumbs plugin for the Neovim editor.
return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    -- configurations go here
  },
}
