-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- require('zk').setup()
    'mickael-menu/zk-nvim',
    config = function()
      require('zk').setup {
        picker = 'telescope',
        --lsp = {
        --  -- `config` is passed to `vim.lsp.start_client(config)`
        --  config = {
        --    cmd = { 'zk', 'lsp' },
        --    name = 'zk',
        --    -- on_attach = ...
        --    -- etc, see `:h vim.lsp.start_client()`
        --  },
        --  -- automatically attach buffers in a zk notebook that match the given filetypes
        --  auto_attach = {
        --    enabled = true,
        --    filetypes = { 'markdown' },
        --  },
        --},
      }

      local opts = { noremap = true, silent = false }
      -- Create a new note after asking for its title.
      vim.api.nvim_set_keymap('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
      vim.api.nvim_set_keymap('n', '<leader>zng', "<Cmd>ZkNew { title = vim.fn.input('Title: '), dir = vim.fn.input('Group: ') }<CR>", opts)

      -- Open notes.
      vim.api.nvim_set_keymap('n', '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
      -- Open notes associated with the selected tags.
      vim.api.nvim_set_keymap('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)

      -- Search for the notes matching a given query.
      vim.api.nvim_set_keymap('n', '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
      -- Search for the notes matching the current visual selection.
      vim.api.nvim_set_keymap('v', '<leader>zf', ":'<,'>ZkMatch<CR>", opts)
    end,
  },
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

      vim.api.nvim_set_keymap('n', '<leader>o', ':Oil --float<CR>', { desc = 'Open oil.nvim file tree' })
    end,
  },
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
  {
    'mbbill/undotree',
    config = function()
      -- local opts = { noremap = true, silent = false }
      vim.api.nvim_set_keymap('n', '<leader>u', '<CMD>UndotreeToggle<CR>', { desc = 'undo tree toggle' })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end)

      vim.keymap.set('n', '<leader>hh', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      local function set_navigation(number)
        vim.keymap.set('n', '<leader>' .. number, function()
          harpoon:list():select(number)
        end, { desc = 'Go to harpoon ' .. number })
      end

      set_navigation(1)
      set_navigation(2)
      set_navigation(3)
      set_navigation(4)
      set_navigation(5)
      set_navigation(6)
      set_navigation(7)
      set_navigation(8)
      set_navigation(9)
    end,
  },
}
