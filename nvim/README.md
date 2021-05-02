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
