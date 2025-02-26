--                        ╭─────────────────────────────╮
--                        │ Map Keys with Minimum Delay │
--                        ╰─────────────────────────────╯
-- Map keys without delay when typing.
return {
  'max397574/better-escape.nvim',
  config = function()
    require('better_escape').setup {
      timeout = vim.o.timeoutlen,
      default_mappings = true,
      mappings = {
        i = {
          k = {
            -- These can all also be functions
            k = '<Esc>',
            j = '<Esc>',
          },
        },
        c = {
          k = {
            k = '<Esc>',
            j = '<Esc>',
          },
        },
        -- t = {
        --     j = {
        --         k = "<C-\\><C-n>",
        --     },
        -- },
        v = {
          k = {
            j = '<Esc>',
          },
        },
        s = {
          k = {
            j = '<Esc>',
          },
        },
      },
    }
  end,
}
