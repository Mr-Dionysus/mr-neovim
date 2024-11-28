--                               ╭───────────────╮
--                               │ Auto-Snippets │
--                               ╰───────────────╯
-- Automagical editing and creation of snippets.
return {
  'chrisgrieser/nvim-scissors',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = {
    snippetDir = 'path/to/your/snippetFolder',
  },
}
