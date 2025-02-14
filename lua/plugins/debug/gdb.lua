--                                   ╰───────╯
-- Neovim thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB.
return {
  'sakhnik/nvim-gdb',
  init = function()
    vim.g.nvimgdb_disable_start_keymaps = 1
    vim.keymap.set(
      'n',
      '<leader>dp',
      ':GdbStartPDB python -m pdb main.py<CR>',
      { desc = '[P]ython', silent = true }
    )
  end,
}
