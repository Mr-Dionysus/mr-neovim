--                                  ╭────────╮
--                                  │ Remote │
--                                  ╰────────╯
-- 🚧 (Alpha stage software) Edit files, run programs,
-- and work with LSP on a remote machine from the comfort
-- of your local environment 🚧.
return {
  'chipsenkbeil/distant.nvim',
  branch = 'v0.3',
  config = function()
    require('distant'):setup()
  end,
}
