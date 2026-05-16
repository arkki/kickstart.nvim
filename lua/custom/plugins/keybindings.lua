-- Custom keybindings for neo-tree and gitsigns

-- Neo-tree keybindings
do
  vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
  vim.keymap.set('n', '<leader>E', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal file in explorer', silent = true })
end

-- Gitsigns keybindings for navigating changes
do
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      local bufnr = event.buf
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation to next/previous git change
      map('n', ']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git change' })

      map('n', '[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git change' })

      -- Git operations menu under <leader>g
      map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = 'Git [b]lame line' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git [r]ollback line' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
      map('n', '<leader>gD', function() gitsigns.diffthis '@' end, { desc = 'Git [D]iff against last commit' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Git [u]ndo stage hunk' })
    end,
  })
end

-- Register which-key menu for gitsigns
do
  local wk = require('which-key')
  wk.add({
    { '<leader>g', group = '[G]it', mode = 'n' },
  })
end

