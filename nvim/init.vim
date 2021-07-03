" init autocmd
autocmd!
" vimrcでマルチバイト文字を使用しているため設定
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Leader - 使いまわせるprefix key
let mapleader = ','

" if hidden is not set, TextEdit might fail.
set hidden

set noshowmode

" don't give |ins-completion-menu| messages.
set shortmess+=c

set helplang=en

" 他のバッファに移動する時に自動保存
set autowrite

" 変更の反映タイミングを早める
set updatetime=250

" 行番号
set nonumber

" always show signcolumns
set signcolumn=yes

" 既存のファイルを開くとき、vimが使用する文字コードを判定する順番
" 先頭から順に試される
set fileencodings=utf-8,sjis,euc-jp,latin

" タブを常に表示
set showtabline=2

" ミュート
set belloff=all

set title
set nobackup
set cmdheight=1
set laststatus=2
" swapファイルを使わない
set noswapfile
" ビルトインのファイラnetrwをoff
let loaded_netrwPlugin = 1

let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" undoできる最大数
set undolevels=100

" クリップボードを共有
if system("uname -s") == "Darwin"
  set clipboard+=unnamed
else
  set clipboard+=unnamedplus
endif

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


"-------------------------------------------------------------------------------
" 検索
"-------------------------------------------------------------------------------

" 検索時大文字小文字を区別しない
set ignorecase

" 検索時に大文字を入力した場合ignorecaseが無効になる
set smartcase

" 置換をインタラクティブにする
set inccommand=split

" work well in tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"-------------------------------------------------------------------------------
" インデント
"-------------------------------------------------------------------------------

" 自動インデントの空白の数
set shiftwidth=2

" タブでも常に空白を挿入
set tabstop=2

" Tabの文字分入力されたとき、tabに変換せずスペースのままになる
set expandtab

" ファイル形式別プラグインとインデントを有効にする
filetype plugin indent on

" 拡張子ごとのインデント設定
augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType ruby setlocal shiftwidth=2 tabstop=2
  au FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType python setlocal tabstop=4 shiftwidth=4
  au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType fish setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType coffee setlocal shiftwidth=2 tabstop=2
augroup END

"-------------------------------------------------------------------------------
" 拡張子系
"-------------------------------------------------------------------------------

set suffixesadd=.js,.es,.jsx,.ts,.tsx,.json,.css,.less,.sass,.styl,.php,.py,.md

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

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue,*.js,*.jsx,*.ts,*.tsx'

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
let g:ruby_host_prog = $RBENV_ROOT.'/versions/2.6.6/bin/neovim-ruby-host'
let g:node_host_prog = $NODENV_ROOT.'/versions/12.20.1/bin/neovim-node-host'

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/node_modules/*
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" コメントアウト行で改行時にコメントアウトしない
set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro

" jsonファイルでのコメントを可能にする(tsconfigのみ)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" jsonc syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+


" ----------------------
"  Utils
" ----------------------

augroup vimrc-misc
  au!
  au WinEnter,FocusGained * checktime
augroup END

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu wildmode=list:full
set nowrap "No Wrap lines

" マウスを使えるようにする
set mouse=a

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

set cursorline

" 全モードでblock cursorを使用
set guicursor=a:block

" カーソルが常に中央に来るようにする
set scrolloff=100
" set scrolloff=10

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

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

"-------------------------------------------------------------------------------
" source other config files 
"-------------------------------------------------------------------------------
source ~/dotfiles/nvim/plugins/dein.rc.vim
source ~/dotfiles/nvim/.maps.vim

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
