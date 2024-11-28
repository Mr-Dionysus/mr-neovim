--                             ╭──────────────────╮
--                             │ Notes Management │
--                             ╰──────────────────╯
-- Modernity meets insane extensibility. The future of
-- organizing your life in Neovim.
return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  config = true,
}
