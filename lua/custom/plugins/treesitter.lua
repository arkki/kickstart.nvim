-- Treesitter textobject extensions and configuration

-- Install nvim-treesitter-textobjects plugin
do
  vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }
end

-- Configure treesitter textobjects for function navigation and selection
do
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local bufnr = args.buf
      
      -- Navigation keymaps for functions
      vim.keymap.set('n', ']f', function()
        require('nvim-treesitter.textobjects.move').goto_next_start('@function.outer')
      end, { buffer = bufnr, desc = 'Goto next function' })
      
      vim.keymap.set('n', '[f', function()
        require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')
      end, { buffer = bufnr, desc = 'Goto previous function' })
      
      -- Selection keymaps for functions
      vim.keymap.set('x', 'af', function()
        require('nvim-treesitter.textobjects.select').select('@function.outer')
      end, { buffer = bufnr, desc = 'Select outer function' })
      
      vim.keymap.set('x', 'if', function()
        require('nvim-treesitter.textobjects.select').select('@function.inner')
      end, { buffer = bufnr, desc = 'Select inner function' })
    end,
  })
end

