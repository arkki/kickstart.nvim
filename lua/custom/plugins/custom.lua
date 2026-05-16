-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- ---@module 'lazy'
-- ---@type LazySpec
-- ---

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldenable = false
vim.o.foldlevel = 99

vim.o.number = true
vim.o.relativenumber = true

