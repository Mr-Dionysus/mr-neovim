--                             ╭──────────────────╮
--                             │ Jupyter Notebook │
--                             ╰──────────────────╯
-- A neovim plugin for interactively running code with
-- the jupyter kernel. Fork of magma-nvim with improvements
-- in image rendering, performance, and more.
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  build = ':UpdateRemotePlugins',
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12
  end,
}
