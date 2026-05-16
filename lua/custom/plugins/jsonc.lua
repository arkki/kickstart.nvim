-- JSON and JSONC support
-- Adds language server, formatter, and Treesitter parser support for JSON/JSONC files

-- Add JSON/JSONC language server to LSP configuration
do
  local servers = {
    jsonls = {},
  }

  for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
  end
end

-- Add JSON/JSONC Treesitter parsers
do
  local parsers = { 'json', 'jsonc' }
  require('nvim-treesitter').install(parsers)
end

-- Configure JSON/JSONC formatter using conform.nvim
-- Since formatters_by_ft is already configured in init.lua (even if empty),
-- we extend it after conform is loaded
do
  local conform = require('conform')
  conform.formatters_by_ft.json = { 'prettier', 'jq', stop_after_first = true }
  conform.formatters_by_ft.jsonc = { 'prettier', stop_after_first = true }
end

-- Optional: Install jsonls via Mason
-- Uncomment the code below to auto-install json-lsp on startup
--[[
do
  vim.schedule(function()
    require('mason-registry').refresh():once('done', function()
      local registry = require 'mason-registry'
      if not registry.is_installed 'json-lsp' then
        registry.get_package('json-lsp'):install()
      end
    end)
  end)
end
--]]
