nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" 方向keyを変えたいとき
" h: insert mode
" nnoremap h i
" j: left
" nnoremap j h
" k: down
" nnoremap k j
" i: up
" nnoremap i k

" vimコマンドのエイリアス
cnoreabbrev coci coc#util#install()
cnoreabbrev recache dein#recache_runtimepath()

" jとkの同時押しで INSERTモードから抜ける
inoremap jk <Esc>
inoremap kj <Esc>

" ファイル保存と終了
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>

" vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

" backspaceキーで削除
nnoremap dw vb"_d

" Select all
nmap aa gg<S-v>G

" Open BufExplorer
nmap \\ \be

" ハイライトを解除する
nnoremap - :noh<CR>

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

" 行頭と行末移動のkeymapを変更
inoremap <C-s> <Esc>$
inoremap <C-a> <Esc>^
noremap <C-s> <Esc>$
noremap <C-a> <Esc>^

"-------------------------------------------------------------------------------
" Tabs
"-------------------------------------------------------------------------------
" Open current directory
nmap te :tabedit<CR>sf
nmap <S-l> :tabprev<Return>
nmap <S-h> :tabnext<Return>

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
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"-- fugitive
cnoreabbrev gopen Gbrowse
