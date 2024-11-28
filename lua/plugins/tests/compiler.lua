--                                 ╭──────────╮
--                                 │ Compiler │
--                                 ╰──────────╯
-- Neovim compiler for building and running your code
-- without having to configure anything.
return {
  'Zeioth/compiler.nvim',
  cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
  dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
  opts = {},
}
