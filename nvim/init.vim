" init autocmd
autocmd!
" vimrcでマルチバイト文字を使用しているため設定
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Leader - 使いまわせるprefix key
let mapleader = ','

set helplang=en

" 他のバッファに移動する時に自動保存
set autowrite

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

let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" undoできる最大数
set undolevels=1000

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

if has('nvim')
  " incremental substitution
  set inccommand=split
endif

" work well in tmux
set termguicolors
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

" tab: タブの表示を決定する
" trail: 行末に続くスペースを表す
" extends:ウィンドウの幅が狭くて右に省略された文字がある場合に表示される
" preceds: extendsと同じで左に省略された文字がある場合に表示される
" set list
" set listchars=tab:>-,trail:·,extends:>,precedes:<,space:·
" indentLineを非表示にするファイル
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim', 'defx', 'denite']
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'

" indentLine
let g:indentLine_char_list = ['┊', '┊', '┊', '┊']


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

" 描画負担軽減のため、行番号のみハイライト
if !has('nvim')
  set cursorlineopt=number
endif

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

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"-------------------------------------------------------------------------------
" Other plugins
"-------------------------------------------------------------------------------

" vim-go
let g:go_disable_autoinstall = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

" gitgutter
" 反映タイミングを早める
set updatetime=250

" JSX
let g:jsx_ext_required = 0

" localvimrc
let g:localvimrc_ask = 0

if !empty(globpath(&rtp, 'autoload/coc.vim'))
  function! s:coc_configure_and_start() abort
    let g:coc_user_config = {}
    let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
	endfunction
endif

" --- NERD commenter ---
" デフォルトのキーマッピングをオフ
let g:NERDCreateDefaultMappings = 0
" コメントアウト時にスペースを1つ挿入
let NERDSpaceDelims = 1
" コメント記号を左に揃える
let g:NERDDefaultAlign = 'left'
" fishのコメントアウトが対応していなかったので追加
let g:NERDCustomDelimiters = { 'fish': { 'left': '#' } }

" vim-graphql
au BufNewFile,BufRead *.prisma setfiletype graphql

" thinca/vim-zenspace
let g:zenspace#default_mode = 'on'

" Previm(markdownのpreview)
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" vim-workspace
let g:workspace_autocreate = 1
let g:workspace_undodir=$HOME . '/.config/nvim/.undodir'
let g:workspace_autosave = 0
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'

"-------------------------------------------------------------------------------
" Dein
"-------------------------------------------------------------------------------

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

" ビルトインのファイラnetrwをoff
let loaded_netrwPlugin = 1

"-------------------------------------------------------------------------------
" imports
"-------------------------------------------------------------------------------

source ~/dotfiles/nvim/.maps.vim
source ~/dotfiles/nvim/.lightline.vim

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
