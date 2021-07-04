local opt = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', ';f', ':Telescope find_files find_command=rg,--ignore-case,--hidden,--files<CR>', opt)
vim.api.nvim_set_keymap('n', ';r', ':Telescope live_grep find_command=rg,--ignore-case,--hidden,--files<CR>', opt)
vim.api.nvim_set_keymap('n', '\\', ':Telescope buffers<CR>', opt)
vim.api.nvim_set_keymap('n', ';;', ':Telescope help_tags<CR>', opt)

local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    initial_mode = "insert",
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  }
}
