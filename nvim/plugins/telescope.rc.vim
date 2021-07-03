nnoremap <silent> ;f <cmd>Telescope find_files find_command=rg,--ignore-case,--hidden,--files <cr>
nnoremap <silent> ;r <cmd>Telescope live_grep find_command=rg,--ignore-case,--hidden,--files <cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
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
EOF
