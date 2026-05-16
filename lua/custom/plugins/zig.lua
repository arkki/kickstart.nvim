-- Zig language support

-- Install zig.vim plugin
do
  vim.pack.add { 'https://github.com/ziglang/zig.vim' }
  
  -- Configure zig.vim
  vim.g.zig_fmt_autosave = 0
  vim.g.zig_fmt_parse_errors = 0
end

-- Install nvim-treesitter-textobjects for Zig
do
  vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }
end

-- Add Zig Treesitter parser
do
  local parsers = { 'zig' }
  require('nvim-treesitter').install(parsers)
end

-- Format Zig files on save
do
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.zig', '*.zon' },
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

