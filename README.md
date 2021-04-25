## dependent packages

- ag
- font
- peco
- ghq
- ripgrep
- tmux
- tig
- lazygit
- pyenv-virtualenv
- jq
- neovim
  - gem
  - npm
  - pip
  - powerline-status(pip)
  - psutil(pip)
- hub

## vim keymaps

### 検索と置換

| keybind         | operation                                  |
| --------------- | ------------------------------------------ |
| :%s/hage/hoge/g | hage を hoge へ置換(%はファイル全体を表す) |

### fugitive

| keybind      | operation                                          |
| ------------ | -------------------------------------------------- |
| Gstatus      | git status                                         |
| Gwrite       | 現在開いているソースを add                         |
| Gread        | 現在開いているソースの直前コミット時のソースを表示 |
| Gmove [path] | 現在開いているソースを git mv する                 |
| Gremove      | 現在開いているソースを git rm する                 |
| Gcommit      | git commit                                         |
| Gblame       | 現在のソースを git blame                           |
| Gdiff        | git diff                                           |

### utils

| keybind | operation                              |
| ------- | -------------------------------------- |
| zH      | 画面を半ページ分左にずらす             |
| zL      | 画面を半ページ分右にずらす             |
| s       | カーソルの文字を消して挿入             |
| S       | カーソルの行を消して挿入               |
| qa      | 全てのウィンドウを閉じて終了           |
| qa!     | 全てのウィンドウを保存せず閉じて終了   |
| D       | 現在位置から行末まで削除               |
| =       | 自動インデント修正でずれたのを一括修正 |

### vim mode

| cmd                    | mode                                       |
| ---------------------- | ------------------------------------------ |
| map, noremap, unmap    | ノーマル, ビジュアル, 選択, オペレータ待機 |
| nmap, nnoremap, nunmap | ノーマル                                   |
| vmap, vnoremap, vunmap | ビジュアル, 選択                           |
| smap, snoremap, sunmap | 選択                                       |
| xmap, xnoremap, xunmap | ビジュアル                                 |
| omap, onremap, ounmap  | オペレータ待機                             |
| map!, noremap!, unmap! | 挿入, コマンドライン                       |
| imap, inoremap, iunmap | 挿入                                       |
| lmap, lnoremap, lunmap | 挿入, コマンドライン, Lang-Arg             |
| cmap, cnoremap, cunmap | コマンドライン                             |

## tmux keybindings

### ウィンドウ操作

| keybind | operation                  |
| ------- | -------------------------- |
| c       | 新規ウィンドウ作成         |
| w       | ウィンドウの一覧選択       |
| &       | ウィンドウの破棄           |
| '       | 入力番号のウィンドウへ移動 |
| p       | 前のウィンドウへ移動       |
| l       | 以前のウィンドウへ移動     |
| ,       | ウィンドウの名前変更       |
| f       | ウィンドウの検索           |

### ペイン操作

| keybind  | operation                    |
| -------- | ---------------------------- |
| h        | 左右にペイン分割             |
| n        | 上下にペイン分割             |
| q        | ペイン番号を表示             |
| !        | ペインを解除してウィンドウ化 |
| x        | ペインを破棄                 |
| o        | ペインを順に移動             |
| ;        | 以前のペインへ移動           |
| z        | 現在のペインを最大化/復帰    |
| space    | レイアウトを変更             |
| o        | ペインを順に移動             |
| ;        | 以前のペインへ移動           |
| z        | 現在のペインを最大化/復帰    |
| {        | ペインの入れ替え（前方向）   |
| }        | ペインの入れ替え（後方向）   |
| ctrl + o | ペインの入れ替え（全体）     |
| t        | ペインに時計を表示           |
