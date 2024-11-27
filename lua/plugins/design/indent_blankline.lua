return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    exclude = { filetypes = { 'dashboard' } },
  },
  init = function()
    require('ibl').setup {
      indent = {
        char = '│', -- Customize the indent line character
      },
      scope = {
        enabled = true, -- Enable the scope feature
        show_start = false, -- Highlight the start of scopes
        show_end = false, -- Optionally highlight the end of scopes
        highlight = { 'Function', 'Label' },
      },
      exclude = {
        filetypes = { 'help', 'dashboard', 'packer', 'NvimTree' }, -- Exclude certain filetypes
      },
    }
  end,
}
