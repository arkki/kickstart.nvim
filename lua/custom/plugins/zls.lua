-- Zig Language Server (ZLS) configuration

-- Configure and enable ZLS LSP
do
  vim.lsp.config('zls', {
    settings = {
      zls = {
        semantic_tokens = 'partial',
        -- zig_exe_path = vim.fn.expand('~/.local/bin/zig'), -- uncomment if zig not in PATH
      },
    },
  })

  vim.lsp.enable('zls')
end

