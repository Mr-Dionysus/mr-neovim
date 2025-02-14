--                             ╭──────────────────╮
--                             │ Notes Management │
--                             ╰──────────────────╯
-- Orgmode clone written in Lua for Neovim 0.9+.
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      mappings = {
        global = {
          org_agenda = { '<leader>oA', desc = '[A]genda via Org' },
          org_capture = { '<leader>oC', desc = '[C]apture via Org' },
        },
      },
    }

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
