"-------------------------------------------------------------------------------
" Dein
"-------------------------------------------------------------------------------

" call update dein
nnoremap <Leader>ud :call dein#update('dein.vim')<CR>
nnoremap <Leader>u :call dein#update()<CR>
" call recache
nnoremap <Leader>re :call dein#recache_runtimepath()<CR>

let s:dein_dir = expand('~/.cache/dein')
" deinがなかったら取得する
if !isdirectory(s:dein_dir)
  execute '!curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh' s:dein_dir
  execute '!sh ./installer.sh ~/.cache/dein'
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let g:rc_dir = expand('~/.config/nvim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " read toml and cache
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

