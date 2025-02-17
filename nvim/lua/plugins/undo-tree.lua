return {
	{
    'mbbill/undotree',
    config = function()
      -- local opts = { noremap = true, silent = false }
      vim.api.nvim_set_keymap('n', '<leader>u', '<CMD>UndotreeToggle<CR>', { desc = 'undo tree toggle' })
    end,
  },

}
