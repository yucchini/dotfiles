" vimrcでマルチバイト文字を使用しているため設定
scriptencoding utf-8

" Leader - 使いまわせるprefix key
let mapleader = ','

" クリップボードを共有
if system("uname -s") == "Darwin"
  set clipboard+=unnamed
else
  set clipboard+=unnamedplus
endif

set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


"-------------------------------------------------------------------------------
" 検索
"-------------------------------------------------------------------------------

" work well in tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm

"-------------------------------------------------------------------------------
" 拡張子系
"-------------------------------------------------------------------------------

" augroup ReactFiletypes
"   autocmd!
"   autocmd BufRead,BufNewFile *.jsx setf filetype=javascriptreact
"   autocmd BufRead,BufNewFile *.tsx setf filetype=typescript.tsx
" augroup END

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
au WinEnter,BufRead,BufNew,Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\|NOTE\|MEMO\|INFO\|IDEA\)')

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

" 全モードでblock cursorを使用
set guicursor=a:block

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
source $DOTFILES_PATH/nvim/lua/plugins/dein.rc.lua
source $DOTFILES_PATH/nvim/lua/keymap.lua
source $DOTFILES_PATH/nvim/lua/settings.lua

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
