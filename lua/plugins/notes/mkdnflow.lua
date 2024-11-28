--                            ╭─────────────────────╮
--                            │ Markdown Management │
--                            ╰─────────────────────╯
-- Fluent navigation and management of markdown notebooks.
return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup {
      -- Config goes here; leave blank for defaults
    }
  end,
}
