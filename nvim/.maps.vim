nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <Leader>d "_d
nnoremap x "_x

" Increment/decrement(memo用)
" nnoremap <C-a>
" nnoremap <C-x>

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

" ファイル保存と終了
nnoremap ;s :w<CR>
nnoremap ;d :q!<CR>
nnoremap ;a :qa<CR>

" 改行してnormal mode
noremap <Space><CR> o<ESC>

" コメントアウト
nmap <Leader>f <Plug>NERDCommenterToggle
vmap <Leader>f <Plug>NERDCommenterToggle
" コメントアウトしてインサートモード
nmap <Leader>r <Plug>NERDCommenterAppend
" ブロックコメントアウト
nmap <Leader>b <Plug>NERDCommenterSexy
vmap <Leader>b <Plug>NERDCommenterSexy

" vimrcを開く
nnoremap <Leader>. :new ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vi :source ~/.config/nvim/init.vim<CR>

" UpdateRemotePlugins
nnoremap <Leader>ur :UpdateRemotePlugins<CR>

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
" Tabs
"-------------------------------------------------------------------------------
" Open current directory
nmap te :tabedit<CR>sf
nmap fl :tabnext<Return>
nmap fj :tabprev<Return>
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
