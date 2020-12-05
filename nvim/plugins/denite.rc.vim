" Define mappings
augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> l
    \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> t
    \ denite#do_map('toggle_select').'j'
    imap <silent><buffer> <C-n> <Plug>(denite_filter_quit)<DOWN>
    imap <silent><buffer> <C-p> <Plug>(denite_filter_quit)<UP>
    imap <silent><buffer> <CR> <Plug>(denite_filter_quit)<CR>
  endfunction
augroup END

nnoremap [denite] <Nop>
nmap sF [denite]
"nnoremap <silent> SF :<C-u>DeniteBufferDir
"      \ -direction=topleft file file:new<CR>

nnoremap <silent> [denite]<C-g> :<C-u>Denite -buffer-name=search -no-empty grep<CR>
nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>

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
    \ 'prompt': 'λ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

" -----ripgrep-----
" call denite#custom#var('file/rec', 'command',
" \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Ripgrep command on grep source
" rgの方がagより速いらしい
" call denite#custom#var('grep', {
"            \ 'command': ['rg'],
"            \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
"            \ 'recursive_opts': [],
"            \ 'pattern_opt': ['--regexp'],
"            \ 'separator': ['--'],
"            \ 'final_opts': [],
"            \ })

" そもそも ag のレベルで検索対象からはずす
call denite#custom#var('file/rec', 'command', [
      \ 'ag',
      \ '--follow',
      \ '--hidden',
      \ '--nocolor',
      \ '--nogroup',
      \ '-g',
      \ ''
      \ ])

" \ ] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + [
" matcher/ignore_globs 以外のお好みの matcher を指定する
call denite#custom#source('file/rec', 'matchers', ['matcher/substring'])

" 他のソース向けに ignore_globs 自体は初期化
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', s:ignore_globs)

" let s:ignore_globs = [ '.git/', '.ropeproject/', '__pycache__/', 'undo/',
"     \ 'venv/', 'node_modules/', '*.min.*', 'fonts/', 'tmp/', '.cache/', 'vendor/', 'log/', '__snapshots__/']

" Ag command on grep source
call denite#custom#var('grep', {
    \ 'command': ['ag'],
    \ 'default_opts': ['-i', '--vimgrep', '--hidden'],
    \ 'recursive_opts': [],
    \ 'pattern_opt': [],
    \ 'separator': ['--'],
    \ 'final_opts': [],
    \ })

" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    " 現在いるファイルのディレクトリ
    " let l:path = expand('%:p:h')

    " カーソルがある部分のディレクトリを取得してるぽい
    " if has_key(defx#get_candidate(), 'action__path')
    "   let l:path = fnamemodify(defx#get_candidate()['action__path'], ':p:h')
    " endif
    " execute(':Denite -buffer-name=grep-buffer-denite -no-empty '.join(s:denite_option_array, ' ').' grep -path='.l:path)
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

nnoremap <silent> ;r :<C-u>Dgrep<CR>
nnoremap <silent> ;f :<C-u>Denite file/rec<CR>
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>
nnoremap <silent> ;s :<C-u>Denite -resume<CR>

