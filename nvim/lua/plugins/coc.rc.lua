local api, bo, cmd, fn, g, o = vim.api, vim.bo, vim.cmd, vim.fn, vim.g, vim.o
local nvim_set_keymap = vim.api.nvim_set_keymap

g.coc_global_extensions = {
  'coc-tsserver',
  'coc-flow',
  'coc-prettier',
  'coc-eslint',
  'coc-solargraph',
  'coc-css',
  'coc-sh',
  'coc-tabnine',
  'coc-cssmodules',
  'coc-styled-components',
}

function _G.check_back_space()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Completion
nvim_set_keymap('i', '', 'pumvisible() ? "" : v:lua.check_back_space() ? "" : coc#refresh()', { noremap = true, silent = true , expr = true })
nvim_set_keymap('i', '', 'pumvisible() ? "" : ""', { noremap = true, silent = true , expr = true })

nvim_set_keymap('i', '', 'coc#refresh()', { noremap = true, silent = true , expr = true })
nvim_set_keymap("i", '', 'pumvisible() ? coc#_select_confirm() : "u=coc#on_enter()"', { noremap = true, silent = true , expr = true })

-- navigate diagnostic
nvim_set_keymap('n', '[g', '(coc-diagnostic-prev)', { noremap = false, silent = true })
nvim_set_keymap('n', ']g', '(coc-diagnostic-next)', { noremap = false, silent = true })

-- goto definition
nvim_set_keymap('n', 'gd', '(coc-definition)', { noremap = false, silent = true })
nvim_set_keymap('n', 'gy', '(coc-type-definition)', { noremap = false, silent = true })
nvim_set_keymap('n', 'gi', '(coc-implementation)', { noremap = false, silent = true })
nvim_set_keymap('n', 'gr', '(coc-references)', { noremap = false, silent = true })

function _G.show_documentation()
  --if fn.index({ 'vim', 'help' }, bo.filetype) &amp;gt;= 0 then
  --  cmd('h ' .. fn.expand(''))
  --else
  if api.nvim_eval('coc#rpc#ready()') then
    fn.CocActionAsync('doHover')
  else
    cmd('! ' .. o.keywordprg .. ' ' .. fn.expand(''))
  end
end

-- show reference
nvim_set_keymap('n', 'K', 'lua _G.show_documentation()', { noremap = false, silent = true })

-- scroll float popups
nvim_set_keymap('n', '', 'coc#float#has_scroll() ? coc#float#scroll(1) : ""', { noremap = true, silent = true , expr = true })
nvim_set_keymap('n', '', 'coc#float#has_scroll() ? coc#float#scroll(0) : ""', { noremap = true, silent = true , expr = true })
nvim_set_keymap('i', '', 'coc#float#has_scroll() ? "=coc#float#scroll(1)" : ""', { noremap = true, silent = true , expr = true })
nvim_set_keymap('i', '', 'coc#float#has_scroll() ? "=coc#float#scroll(0)" : ""', { noremap = true, silent = true , expr = true })

nvim_set_keymap('n', '', '(coc-float-jump)', { noremap = false, silent = true })
nvim_set_keymap('i', '', '(coc-float-jump)', { noremap = false, silent = true })

-- format
nvim_set_keymap('n', 'lr', '(coc-rename)', { noremap = false, silent = true })
nvim_set_keymap('n', 'lf', 'call CocAction("format")call CocAction("runCommand", "editor.action.organizeImport")', { noremap = true, silent = true })

-- mappings for coclist
nvim_set_keymap('n', 'la', 'CocList diagnostics', { noremap = true, silent = true })
nvim_set_keymap('n', 'le', 'CocList extensions', { noremap = true, silent = true })
nvim_set_keymap('n', 'lc', 'CocList commands', { noremap = true, silent = true })
nvim_set_keymap('n', 'lo', 'CocList outline', { noremap = true, silent = true })
