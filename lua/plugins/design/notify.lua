--                               ╭───────────────╮
--                               │ Notifications │
--                               ╰───────────────╯
-- A fancy, configurable, notification manager for NeoVim.

return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      stages = 'fade', -- Options: "fade", "slide", "static", "fade_in_slide_out"
      timeout = 2000,
      fps = 165,
    }
    vim.notify = require 'notify' -- Override default notifications
  end,
}
