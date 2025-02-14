--                                    ╭─────╮
--                                    │ Git │
--                                    ╰─────╯
-- Super fast git decorations implemented purely in Lua.

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged_enable = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to Next Git [C]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to Previous Git [C]hange' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[S]tage Hunk' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[R]eset Hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage Hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset Hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage Buffer' })
      -- map(
      --   'n',
      --   '<leader>gu',
      --   gitsigns.undo_stage_hunk,
      --   { desc = '[G]it [U]ndo stage hunk' }
      -- )
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset Buffer' })
      map(
        'n',
        '<leader>gu',
        gitsigns.diffthis,
        { desc = '[U]nstaged Changes in Diff' }
      )
      map('n', '<leader>ga', function()
        gitsigns.diffthis '@'
      end, { desc = '[A]ll Changes in Diff' })
      -- Toggles
      map(
        'n',
        '<leader>gb',
        gitsigns.toggle_current_line_blame,
        { desc = '[B]lame Line' }
      )
      -- map(
      --   'n',
      --   '<leader>tD',
      --   gitsigns.toggle_deleted,
      --   { desc = '[T]oggle git show [D]eleted' }
      -- )
    end,
  },
}
