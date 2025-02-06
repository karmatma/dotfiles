return {
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   opts = ...,
  --   config = function()
  --     require('gruvbox').setup {
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = '', -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     }
  --     vim.cmd 'colorscheme gruvbox'
  --   end,
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine'
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'rose-pine',
        callback = function()
          -- vim.api.nvim_set_hl(0, 'Cursor', { fg = '#000000', bg = 'steelblue' })
        end,
      })
    end,
  },
}
