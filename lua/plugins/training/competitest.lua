--                                ╭─────────────╮
--                                │ Competition │
--                                ╰─────────────╯
-- CompetiTest.nvim is a Neovim plugin for Competitive
-- Programming: it can manage and check testcases, download
-- problems and contests from online judges and much more.
return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup()
  end,
}
