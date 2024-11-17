return {
  {
    'ahmedkhalf/project.nvim',
    init = function()
      require('project_nvim').setup {
        require('telescope').load_extension 'projects',
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- lua
        --   require('nvim-tree').setup {
        --     sync_root_with_cwd = true,
        --     respect_buf_cwd = true,
        --     update_focused_file = {
        --       enable = true,
        --       update_root = true,
        --     },
        --   },
      }
    end,
  },
}
