" カレントディレクトリでvimを起動したときにdefxをアイコン付きで起動する
autocmd VimEnter * execute 'Defx -new -columns=indent:mark:icon:icons:filename:git:size'
