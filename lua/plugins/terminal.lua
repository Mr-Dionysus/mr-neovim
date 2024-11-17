return {
  {
    -- amongst your other plugins
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      opts = {
        direction = 'float',
      },
      init = function()
        function _G.set_terminal_keymaps()
          local opts = { buffer = 0 }
          vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts)
          -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
          vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end
        vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
      end,
    },
  },

  {
    'willothy/flatten.nvim',
    config = true,
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
    init = function()
      local flatten = {
        'willothy/flatten.nvim',
        opts = function()
          ---@type Terminal?
          local saved_terminal

          return {
            window = {
              open = 'alternate',
            },
            callbacks = {
              should_block = function(argv)
                -- Note that argv contains all the parts of the CLI command, including
                -- Neovim's path, commands, options and files.
                -- See: :help v:argv

                -- In this case, we would block if we find the `-b` flag
                -- This allows you to use `nvim -b file1` instead of
                -- `nvim --cmd 'let g:flatten_wait=1' file1`
                return vim.tbl_contains(argv, '-b')

                -- Alternatively, we can block if we find the diff-mode option
                -- return vim.tbl_contains(argv, "-d")
              end,
              pre_open = function()
                local term = require 'toggleterm.terminal'
                local termid = term.get_focused_id()
                saved_terminal = term.get(termid)
              end,
              post_open = function(bufnr, winnr, ft, is_blocking)
                if is_blocking and saved_terminal then
                  -- Hide the terminal while it's blocking
                  saved_terminal:close()
                else
                  -- If it's a normal file, just switch to its window
                  vim.api.nvim_set_current_win(winnr)

                  -- If we're in a different wezterm pane/tab, switch to the current one
                  -- Requires willothy/wezterm.nvim
                  require('wezterm').switch_pane.id(tonumber(os.getenv 'WEZTERM_PANE'))
                end

                -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
                -- If you just want the toggleable terminal integration, ignore this bit
                if ft == 'gitcommit' or ft == 'gitrebase' then
                  vim.api.nvim_create_autocmd('BufWritePost', {
                    buffer = bufnr,
                    once = true,
                    callback = vim.schedule_wrap(function()
                      vim.api.nvim_buf_delete(bufnr, {})
                    end),
                  })
                end
              end,
              block_end = function()
                -- After blocking ends (for a git commit, etc), reopen the terminal
                vim.schedule(function()
                  if saved_terminal then
                    saved_terminal:open()
                    saved_terminal = nil
                  end
                end)
              end,
            },
          }
        end,
      }
    end,
  },
}
