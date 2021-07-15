vim.g.loaded_netrwPlugin = '1'
vim.g.loaded_matchparen = '1'

vim.opt.backup = false
vim.opt.hidden = true
-- vimrcでマルチバイト文字を使用しているため設定
vim.opt.shortmess:append 'c'
vim.opt.helplang = 'en'
vim.opt.autowrite = true
vim.opt.updatetime = 250
vim.opt.number = false
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false
vim.opt.fileencodings = 'utf-8'
vim.opt.showtabline = 2
vim.opt.belloff = 'all'
vim.opt.title = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.cmd('set noswapfile')
-- vim.opt.noswapfile = true
vim.opt.shell = 'fish'
vim.opt.undolevels = 100


-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- 文字色・描画
-- vim.opt.t_8f = '\b<Esc>[38;2;%lu;%lu;%lum'
-- vim.opt.t_8b = '\b<Esc>[48;2;%lu;%lu;%lum'
-- vim.opt.t_BE = ''
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.mat = 2

-- indent
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.formatoptions:remove 'ro' -- 改行時のコメントアウトをoff
vim.cmd('autocmd FileType * setlocal formatoptions-=ro')
-- vim.opt.nowrap = false
vim.cmd('set nowrap')
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:full'
vim.opt.mouse = 'a'
vim.opt.cursorline = true
-- vim.opt.guicuror = 'a:block' -- 全てのmodeでblock cursorを使用
vim.opt.scrolloff = 100 --カーソルが常に中央に来るようにする

-- Extensions
vim.opt.suffixesadd = '.js,.es,.jsx,.ts,.tsx,.json,.css,.less,.sass,.style,.php,.py,.md,.java,.rb,.vim,.lua,.vimrc,.conf,.go'
vim.opt.path:append '**'
vim.opt.wildignore:append '*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store/*,*/node_modules/*'
-- Enable json comment(only tsconfig)
vim.cmd('autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc')
vim.cmd('autocmd FileType json syntax match Comment +\b/\b/.\b+$+')
-- JavaScript
vim.cmd('au BufNewFile,BufRead *.es6 setf javascript')
-- TypeScript
vim.cmd('au BufNewFile,BufRead *.ts setf typescript')
vim.cmd('au BufNewFile,BufRead *.tsx set filetype=typescript.tsx')
-- Markdown
vim.cmd('au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown')
-- Flow
vim.cmd('au BufNewFile,BufRead *.flow set filetype=javascript')
-- fish
vim.cmd('au BufNewFile,BufRead fish_funced set filetype=fish')


if vim.fn.has('conceal') then
  vim.opt.conceallevel = 2
  vim.opt.concealcursor = 'niv'
end

vim.cmd('filetype plugin indent on')

vim.cmd('augroup fileTypeIndent')
vim.cmd('au!')
vim.cmd('au FileType go setlocal tabstop=4 shiftwidth=4')
vim.cmd('au FileType python setlocal tabstop=4 shiftwidth=4')
vim.cmd('augroup END')

vim.g.python_host_prog = os.getenv('PYENV_ROOT')..'/versions/neovim2/bin/python'
vim.g.python3_host_prog = os.getenv('PYENV_ROOT')..'/versions/neovim3/bin/python'
vim.g.ruby_host_prog = os.getenv('RBENV_ROOT')..'/versions/2.6.6/bin/neovim-ruby-host'
vim.g.node_host_prog = os.getenv('NODENV_ROOT')..'/versions/12.20.1/bin/neovim-node-host'
