-- dein keymaps
--vim.api.nvim_set_keymap('n', '<Leader>ud', ':call dein#update("dein.vim")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ud', ':DeinUpdate<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>u', ':call dein#update()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>re', ':call dein#recache_runtimepath()<CR>', { noremap = true })

local dein_dir = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

if not string.find(vim.api.nvim_get_option('runtimepath'), '/dein.vim') then
  if not (vim.fn.isdirectory(dein_repo_dir) == 1) then
    os.execute('curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh '..dein_dir)
    os.execute('sh ./installer.sh '..dein_dir)
  end
  vim.api.nvim_set_option('runtimepath', dein_repo_dir..','..vim.api.nvim_get_option('runtimepath'))
end

if (vim.fn['dein#load_state'](dein_dir) ==1) then
  vim.fn['dein#begin'](dein_dir)
  local rc_dir = vim.fn.expand('~/.config/nvim/rc')
  local toml =  rc_dir..'/dein.toml'
  local lazy_toml =  rc_dir..'/dein_lazy.toml'
  vim.fn['dein#load_toml'](toml, { lazy = 0 })
  vim.fn['dein#load_toml'](lazy_toml, { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

if (vim.fn['dein#check_install']() ~= 0) then
  vim.fn['dein#install']()
end

local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
  vim.fn.map(removed_plugins, 'delete(v:val, "rf")')
  vim.fn['dein#recache_runtimepath']()
end
