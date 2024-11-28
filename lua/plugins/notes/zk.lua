--                               ╭──────────────╮
--                               │ Zk Assistant │
--                               ╰──────────────╯
-- Neovim extension for zk.
return {
  'zk-org/zk-nvim',
  config = function()
    require('zk').setup {
      -- See Setup section below
    }
  end,
}
