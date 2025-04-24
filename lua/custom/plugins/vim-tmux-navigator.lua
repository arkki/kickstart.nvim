return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', ':TmuxNavigateLeft<cr>' },
      { '<c-Left>', ':TmuxNavigateLeft<cr>' },
      { '<c-j>', ':TmuxNavigateDown<cr>' },
      { '<c-Down>', ':TmuxNavigateDown<cr>' },
      { '<c-k>', ':TmuxNavigateUp<cr>' },
      { '<c-Up>', ':TmuxNavigateUp<cr>' },
      { '<c-l>', ':TmuxNavigateRight<cr>' },
      { '<c-Right>', ':TmuxNavigateRight<cr>' },
      { '<c-\\>', ':TmuxNavigatePrevious<cr>' },
    },
    -- config = function() {
    --  vim.keymap.set('n', '<C-Left>', '< s'
  },
}
