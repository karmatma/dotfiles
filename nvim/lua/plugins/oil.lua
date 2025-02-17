return {
	 {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
      }

      -- local opts = { noremap = true, silent = false }

      vim.api.nvim_set_keymap('n', '<leader>-', ':Oil --float<CR>', { desc = 'Open oil.nvim file tree' })
    end,
  },

}
