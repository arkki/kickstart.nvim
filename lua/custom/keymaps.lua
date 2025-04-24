-- Normal mode: Toggle comment line
vim.keymap.set('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment line' })

-- Visual mode: Toggle comment selection
vim.keymap.set('v', '<leader>/', function()
  -- Use the current visual selection
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment selection' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>sb', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[b] Fuzzily search in current buffer' })

-- Netrw
vim.keymap.set('n', '<leader>e', ':Explore<CR>', { silent = true, desc = 'Open Netrw file explorer' })
