" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" 行番号
set number
set nocompatible
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
" Tabの文字分入力されたとき、tabに変換せずスペースのままになる
set expandtab
let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*
" ヤンクをクリップボードと共有させる                                                                                                                                                                                 │  .npm/
set clipboard+=unnamed"

function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" work well in tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
" set t_ut=

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.ts,.tsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.ts setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx setf filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx setf filetype=typescriptreact
augroup END

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr       cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

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

" JSX
let g:jsx_ext_required = 0

" Tern
" Disable auto preview window
set completeopt-=preview

" localvimrc
let g:localvimrc_ask = 0

if !empty(globpath(&rtp, 'autoload/coc.vim'))
  function! s:coc_configure_and_start() abort
    let g:coc_user_config = {}
    let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'
	endfunction
endif
"-------------------------------------------------------------------------------
" Dein
"-------------------------------------------------------------------------------

let s:dein_dir = expand('~/.cache/dein')
" deinがなかったら取得する
if !isdirectory(s:dein_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

set guifont=Sauce\ Code\ Pro\ Light\ Nerd\ Font\ Complete\ Windows\ Compatible:h11
let g:webdevicons_enable_vimfiler = 1

"-------------------------------------------------------------------------------
" imports
"-------------------------------------------------------------------------------

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    source ~/.osx.vimrc
  endif
endif

source ~/.maps.vimrc
source ~/.lightline.vimrc

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------

colorscheme solarized

set exrc
