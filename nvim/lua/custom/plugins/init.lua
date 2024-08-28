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
}
