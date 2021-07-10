lua << EOF
local opt = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>co', ':call coc#util#install()<CR>', opt)
vim.api.nvim_set_keymap('n', '<Leader>col', ':CocOpenLog<CR>', opt)
-- vim.api.nvim_set_keymap('n', '<Esc>', ':call coc#float#close_all()', opt)
vim.api.nvim_set_keymap('n', '<Leader>cre', ':call coc#refresh()<CR>', opt)

-- Remap keys for gotos
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', 'K', ':call <SID>show_documentation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'R', '<Plug>(coc-rename)', { silent = true })


-- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
-- Coc only does snippet and additional edit on confirm.
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-y>" : "<C-g>u<CR>"', { noremap = true, expr = true })

-- Use tab for trigger completion with characters ahead and navigate.
--Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : <SID>check_back_space() ? "<TAB>" : coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true })
EOF

if !empty(globpath(&rtp, 'autoload/coc.vim'))
  function! s:coc_configure_and_start() abort
    let g:coc_user_config = {}
    let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
	endfunction
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc-cssでscssファイルにおいて@をkeywordとして登録する
autocmd FileType scss setl iskeyword+=@-@

" coc-eslint
autocmd BufNewFile,BufReadPre,BufEnter
  \ *.{flow,config.js,config.copy.js,config.lib.js,config.style.js,config.proxy.js}
  \   call coc#config('eslint.enable', v:false)
autocmd BufLeave
  \ *.{js,jsx,ts,tsx}
  \   call coc#config('eslint.enable', v:true)

" Extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-flow',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-solargraph',
  \ 'coc-css',
  \ 'coc-sh',
  \ 'coc-tabnine',
  \ 'coc-cssmodules',
  \ 'coc-styled-components',
  \ ]

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
