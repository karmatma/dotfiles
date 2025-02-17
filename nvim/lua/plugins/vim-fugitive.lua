return {
	{
    'tpope/vim-fugitive',
    config = function()
      -- local opts = { noremap = true, silent = false }
      -- pick the target change on the left
      vim.api.nvim_set_keymap('n', '<leader>g2', '<CMD>diffget //2 | diffup<CR>', { desc = 'keep target changes from left and align the diff page' })
      -- pick the merge branch change on the right
      vim.api.nvim_set_keymap('n', '<leader>g3', '<CMD>diffget //3 | diffup<CR>', { desc = 'take feature changes from right and align the diff page' })
    end,
  },

}
