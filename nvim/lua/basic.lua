vim.g.loaded_netrwPlugin = '1'
vim.g.loaded_matchparen = '1'

vim.api.nvim_command('set hidden')
vim.api.nvim_command('set noshowmode')
-- vimrcでマルチバイト文字を使用しているため設定
vim.api.nvim_command('set shortmess+=c')
vim.api.nvim_command('set helplang=ja')
-- 他のバッファに移動する時に自動保存
vim.api.nvim_command('set autowrite')
vim.api.nvim_command('set updatetime=250')
vim.api.nvim_command('set nonumber')
vim.api.nvim_command('set signcolumn=yes')
-- 既存のファイルを開くとき、vimが使用する文字コードを判定する順番
-- 先頭から順に試される
vim.api.nvim_command('set fileencodings=utf-8,sjis,euc-jp,latin')
vim.api.nvim_command('set showtabline=2')
vim.api.nvim_command('set belloff=all')
vim.api.nvim_command('set title')
vim.api.nvim_command('set nobackup')
vim.api.nvim_command('set cmdheight=1')
vim.api.nvim_command('set laststatus=2')
vim.api.nvim_command('set noswapfile')
vim.api.nvim_command('set shell=fish')
vim.api.nvim_command('set undolevels=100')

-- 検索
vim.api.nvim_command('set ignorecase')
vim.api.nvim_command('set smartcase')
-- 置換をインタラクティブにする
vim.api.nvim_command('set inccommand=split')
vim.api.nvim_command('set t_8f=^[[38;2;%lu;%lu;%lum')
vim.api.nvim_command('t_8b=^[[48;2;%lu;%lu;%lum')
vim.api.nvim_command('set t_BE=')
vim.api.nvim_command('set nosc noru nosm')
vim.api.nvim_command('set lazyredraw')
vim.api.nvim_command('set lazyredraw')
vim.api.nvim_command('set showmatch')
vim.api.nvim_command('set mat=2')
-- indent
vim.api.nvim_command('set shiftwidth=2')
vim.api.nvim_command('set tabstop=2')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set formatoptions-=ro')
vim.api.nvim_command('set nowrap')
vim.api.nvim_command('set wildmenu wildmode=list:full')
vim.api.nvim_command('set mouse=a')
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set guicursor=a:block')
vim.api.nvim_command('set scrolloff=100')
