nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <Leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" バッファの再読み込み
nnoremap <Leader>e :tabdo edit<CR>

" set number
nnoremap <Leader>s :set number<CR>
" set nonumber
nnoremap <Leader>ns :set nonumber<CR>

" redo
nnoremap <S-u> <C-r>

" 外部コマンドの入力
nnoremap <Leader>ca :!

" 置換(ファイル内で対象のものを全て置換したいときはサイトに/gつける)
nnoremap <Leader>c :%s//

" vimコマンドのエイリアス
cnoreabbrev coci coc#util#install()
cnoreabbrev recache dein#recache_runtimepath()

" ファイル保存と終了
nnoremap ;s :w<CR>
nnoremap ;d :q!<CR>
nnoremap ;a :qa<CR>

noremap <Space><CR> o<ESC>

" 選択
nnoremap <Leader>v <S-v>

" コメントアウト
nmap <Leader>f <Plug>NERDCommenterToggle
vmap <Leader>f <Plug>NERDCommenterToggle
" コメントアウトしてインサートモード
nmap <Leader>r <Plug>NERDCommenterAppend
" ブロックコメントアウト
nmap <Leader>b <Plug>NERDCommenterSexy
vmap <Leader>b <Plug>NERDCommenterSexy

" vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <Leader>vi :source ~/.vimrc<CR>

" bとwの移動キーの変更
noremap <S-l> w
noremap <S-h> b

" call update dein
nnoremap <Leader>ud :call dein#update('dein.vim')<CR>
nnoremap <Leader>u :call dein#update()<CR>

" UpdateRemotePlugins
nnoremap <Leader>ur :UpdateRemotePlugins<CR>

" coc.nvimでfloatingが消えない時に消すkeymap
nmap <Esc> :call coc#float#close_all() <CR>

" call recache
nnoremap <Leader>re :call dein#recache_runtimepath()<CR>
" call coci
nnoremap <Leader>co :call coc#util#install()<CR>

" backspaceキーで削除
nnoremap dw vb"_d

" Select all
nmap aa gg<S-v>G

" Open BufExplorer
nmap \\ \be

" ハイライトを解除する
nnoremap - :noh<CR>

" syntax highlightを再読み込み
nnoremap <F9> :syntax sync fromstart<CR>

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-------------------------------------------------------------------------------
" vim-go
"-------------------------------------------------------------------------------
nnoremap <Leader>gr :GoRun<CR>

"-------------------------------------------------------------------------------
" Colorizer
"-------------------------------------------------------------------------------
nnoremap <Leader>cl :ColorHighlight<CR>

"-------------------------------------------------------------------------------
" vim-auto-save
"-------------------------------------------------------------------------------
nnoremap <Leader>as :AutoSaveToggle<CR>

"-------------------------------------------------------------------------------
" vim-surround
"-------------------------------------------------------------------------------
nnoremap <Leader>ds ds'
nnoremap <Leader>dss ds"
nnoremap <Leader>di di'
nnoremap <Leader>dii di"
nnoremap <Leader>ys ysiw'
nnoremap <Leader>yss ysiw"

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------
nmap <Leader>st :Gstatus<CR>
nmap <Leader>ad :Gwrite<CR>
nmap <Leader>cm :Gcommit<CR>
nmap <Leader>gl :Git blame<CR>
nmap <Leader>diff :Gdiff<CR>
nmap <Leader>coutr :Gread<CR>

" Gitgutter
" 変更点の部分にジャンプ
nmap gl <Plug>(GitGutterNextHunk)
nmap gh <Plug>(GitGutterPrevHunk)

"-------------------------------------------------------------------------------
" Tabs
"-------------------------------------------------------------------------------
" Open current directory
nmap te :tabedit<CR>sf
" nmap <S-h> :tabprev<Return>
" nmap <S-l> :tabnext<Return>
nmap <Tab> :tabnext<Return>
nmap <S-Tab> :tabprev<Return>
" Close current tab
nmap cl :tabclose<CR>

"-------------------------------------------------------------------------------
" Windows
"-------------------------------------------------------------------------------
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <Leader>h <C-w><
nmap <Leader>l <C-w>>
nmap <Leader>k <C-w>+
nmap <Leader>j <C-w>-

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"-- fugitive
cnoreabbrev gopen Gbrowse
