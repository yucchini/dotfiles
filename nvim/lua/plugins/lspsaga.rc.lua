local saga = require'lspsaga'

saga.init_lsp_saga {}

local opt = { noremap = true }

vim.api.nvim_set_keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', opt)
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opt)
vim.api.nvim_set_keymap('n', '<C-k>', ':Lspsaga signature_help<CR>', opt)
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', opt)
