luafile ~/dotfiles/nvim/lua/settings.lua

" Leader - 使いまわせるprefix key
let mapleader = ','

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.ts setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" fish
au BufNewFile,BufRead fish_funced set filetype=fish

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx setf filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx setf filetype=typescriptreact
augroup END

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
let g:ruby_host_prog = $RBENV_ROOT.'/versions/2.6.6/bin/neovim-ruby-host'
let g:node_host_prog = $NODENV_ROOT.'/versions/12.20.1/bin/neovim-node-host'

" ----------------------
"  Utils
" ----------------------

augroup vimrc-misc
  au!
  au WinEnter,FocusGained * checktime
augroup END

" ペーストするときに自動インデントでずれないようにする
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" undoの保存先
if has('persistent_undo')
  let undo_path = expand('~/.config/nvim/undo')
  " ディレクトリが存在しない場合は作成
  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif
  exe 'set undodir=' .. undo_path
  set undofile
endif

" コメント中の特定の単語を強調表示する
autocmd WinEnter,BufRead,BufNew,Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\|NOTE\|MEMO\|INFO\|IDEA\)')

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

" カーソルラインの位置を保存する
augroup cursorlineRestore
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
augroup END

"-------------------------------------------------------------------------------
" source other config files
"-------------------------------------------------------------------------------
source ~/dotfiles/nvim/lua/plugins/dein.rc.lua
source ~/dotfiles/nvim/lua/keymap.lua

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set background=dark
  colorscheme NeoSolarized
  let g:neosolarized_termtrans=1
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  let g:solarized_termcolors=256
  runtime ./colors/solarized_true.vim

  " 一行が長いファイルをsyntaxを制御することで軽くする
  " これを有効にすると1行が長すぎる行があった場合、その行以降がhighlightされない
  " set synmaxcol=256
endif
