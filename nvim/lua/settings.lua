vim.g.loaded_netrwPlugin = '1'
vim.g.loaded_matchparen = '1'

vim.opt.backup = false
vim.opt.hidden = true
-- vimrcでマルチバイト文字を使用しているため設定
vim.opt.shortmess:append 'c'
vim.opt.helplang = 'en'
vim.opt.autowrite = true
vim.opt.updatetime = 250
vim.opt.nonumber = true
vim.opt.signcolumn = yes
vim.opt.noshowmode = true
vim.opt.fileencoding  = 'utf-8'
vim.opt.showtabline = 2
vim.opt.belloff = 'all'
vim.opt.title = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.noswapfile = true
vim.opt.shell = 'fish'
vim.opt.undolevels = 100


-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- 文字色・描画
vim.opt.t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
vim.opt.t_8b = '\<Esc>[48;2;%lu;%lu;%lum'
vim.opt.t_BE = ''
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.mat = 2

-- indent
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.formatoptions:remove 'ro' -- 改行時のコメントアウトをoff
vim.cmd('autocmd FileType * setlocal formatoptions-=ro')
vim.opt.nowrap = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:full'
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.guicuror = 'a:block' -- 全てのmodeでblock cursorを使用
vim.opt.scrolloff = 100 --カーソルが常に中央に来るようにする

-- expansion
vim.opt.suffixesadd = '.js,.es,.jsx,.ts,.tsx,.json,.css,.less,.sass,.style,.php,.py,.md,.java,.rb,.vim,.lua,.vimrc,.conf,.go'
vim.opt.path:append '**'
vim.opt.wildignore:append '*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/node_modules/*'
-- Enable json comment(only tsconfig)
vim.cmd('autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc')
vim.cmd('autocmd FileType json syntax match Comment +\/\/.\+$+')


if vim.fn.has('conceal') then
  vim.opt.conceallevel = 2
  vim.opt.concealcursor = 'niv'
end

vim.cmd('fletype plugin indent on')

vim.cmd('augroup fileTypeIndent')
vim.cmd('au!')
vim.cmd('au FileType go setlocal tabstop=4 shiftwidth=4')
vim.cmd('au FileType python setlocal tabstop=4 shiftwidth=4')
vim.cmd('augroup END')
