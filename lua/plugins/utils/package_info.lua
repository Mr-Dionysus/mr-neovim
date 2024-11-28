--                               ╭──────────────╮
--                               │ Package Info │
--                               ╰──────────────╯
-- ✍️ All the npm/yarn/pnpm commands I don't want to type.

return {
  'vuki656/package-info.nvim',
  requires = 'MunifTanjim/nui.nvim',
  init = function()
    require('package-info').setup()
  end,
}
