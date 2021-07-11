lua << EOF
local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', ';r', ':<C-u>Dgrep<CR>', opt)
vim.api.nvim_set_keymap('n', ';f', ':<C-u>Denite file/rec -start-filter<CR>', opt)
vim.api.nvim_set_keymap('n', ';;', ':<C-u>Denite command command_history<CR>', opt)
vim.api.nvim_set_keymap('n', ';e', ':<C-u>Denite -resume<CR>', opt)

--vim.cmd('augroup denite_filter')
--vim.cmd('autocmd FileType denite call s:denite_my_settings()')
--  function denite_my_settings()
--    local opt_noremap = { noremap = true, silent = true, expr = true }
--    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', 'denite#do_map("do_action")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', 'l', 'denite#do_map("do_action", "vsplit")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', '<Space>', 'denite#do_map("do_action", "split")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', 'd', 'denite#do_map("do_action", "delete")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', 'p', 'denite#do_map("do_action", "preview")', opt_noremap)
--   vim.api.nvim_buf_set_keymap(0, 'n', 'q', 'denite#do_map("quit")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', 'i', 'denite#do_map("open_filter_buffer")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'n', 't', 'denite#do_map("toggle_select")', opt_noremap)
--    vim.api.nvim_buf_set_keymap(0, 'i', '<C-n>', '<Plug>(denite_filter_quit)<DOWN>', { silent = true })
--    vim.api.nvim_buf_set_keymap(0, 'i', '<C-p>', '<Plug>(denite_filter_quit)<UP>', { silent = true })
--    vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<Plug>(denite_filter_quit)<CR>', { silent = true })
--  end
--vim.cmd('augroup END')
EOF

augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> l denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> t denite#do_map('toggle_select').'j'
    imap <silent><buffer> <C-n> <Plug>(denite_filter_quit)<DOWN>
    imap <silent><buffer> <C-p> <Plug>(denite_filter_quit)<UP>
    imap <silent><buffer> <CR> <Plug>(denite_filter_quit)<CR>
  endfunction
augroup END

" use floating
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

" -----ripgrep-----
" --ignore-case: 大文字小文字の区別を無視
call denite#custom#var('file/rec', 'command', [
        \ 'rg',
        \ '--files',
        \ '--ignore-case',
        \ '--hidden',
        \ '--glob',
        \ '!.git',
        \ '--color',
        \ 'never'
        \ ])

" Ripgrep command on grep source
" rgの方がagより速いらしい
call denite#custom#var('grep', {
           \ 'command': ['rg'],
           \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
           \ 'recursive_opts': [],
           \ 'pattern_opt': ['--regexp'],
           \ 'separator': ['--'],
           \ 'final_opts': [],
           \ })

" matcher/ignore_globs 以外のお好みの matcher を指定する
call denite#custom#source('file/rec', 'matchers', ['matcher/substring'])

" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    " Projectのルートを基準にgrep
    execute(':DeniteProjectDir -buffer-name=grep-buffer-denite -no-empty '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction
" show Denite grep results
command! Dresume execute(':Denite -resume -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').'')
" next Denite grep result
command! Dnext execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=+1 -immediately '.join(s:denite_option_array, ' ').'')
" previous Denite grep result
command! Dprev execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=-1 -immediately '.join(s:denite_option_array, ' ').'')
" keymap
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
