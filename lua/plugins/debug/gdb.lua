--                                   ╰───────╯
-- Neovim thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB.
return {
  'sakhnik/nvim-gdb',
  keys = {
    {
      '<leader>dp',
      ':GdbStartPDB python -m pdb main.py<CR>',
      mode = { 'n' },
      desc = '[P]ython',
      silent = true,
    },
  },
  init = function()
    vim.g.nvimgdb_disable_start_keymaps = 1
  end,
}
