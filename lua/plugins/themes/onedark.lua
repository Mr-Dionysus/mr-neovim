return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  --[[
    init = function()
      require('onedark').setup {
        -- Your posted configuration
        style = 'light',
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
      }
      require('onedark').load()
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
    ]]
}
