" カレントディレクトリでvimを起動したときにdefxを起動する
autocmd VimEnter * execute 'Defx -new -columns=indent:mark:icon:filename:git:size'
