## Usage

```shell
$ cd ~/ # if windows use this > cd %HOMEPATH%
$ git clone https://github.com/your_name/dotfiles.git
$ sh dotfilesLink.sh # if windows use this > mklink.bat
```

※ `sh dotfilesLink.sh`を実行する時は既存のシンボリックリンクやファイル位置に注意

## dependent packages

- ag
- powerline
- font
- fzf
- peco
- ghq
- bat
- ripgrep
- tmux
- tig
- neovim
  - gem
  - npm
  - pip
- hub

## 困ったときに実行する vim script

```vim
:call dein#recache_runtimepath()
:call coc#util#install()
```

## vim keymaps

### 移動

| keybind | operation          |
| ------- | ------------------ |
| w / b   | 単語の先頭に移動   |
| e / ge  | 単語の最後尾に移動 |

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

| keybind | operation                            |
| ------- | ------------------------------------ |
| zH      | 画面を半ページ分左にずらす           |
| zL      | 画面を半ページ分右にずらす           |
| a       | カーソルの文字の後から挿入           |
| I       | カーソルの行頭から挿入               |
| A       | カーソルの行末から挿入               |
| s       | カーソルの文字を消して挿入           |
| S       | カーソルの行を消して挿入             |
| qa      | 全てのウィンドウを閉じて終了         |
| qa!     | 全てのウィンドウを保存せず閉じて終了 |
| vw      | 単語選択                             |
| v\$     | 現在位置から行末まで選択             |
| v^      | 現在位置から行頭まで選択             |
| dw      | 1 単語削除                           |
| D       | 現在位置から行末まで削除             |
| yw      | 1 単語コピー                         |

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

### コピーモード

| keybind | operation                                  |
| ------- | ------------------------------------------ |
| [       | コピーモードの開始（カーソルで自由に移動） |
| space   | コピー開始位置決定（vi モード）            |
| Enter   | コピー終了位置決定（vi モード）            |
| ]       | コピーした内容を貼り付け                   |

### パネル操作

| keybind                                  | operation           |
| ---------------------------------------- | ------------------- |
| !                                        | 画面分割を解除する  |
| space                                    | パネルのサイズ調整  |
| :set-window-option synchronize-panes on  | パネルの同期        |
| :set-window-option synchronize-panes off | パネルの同期を\_off |

### セッション操作

| keybind                                  | operation              |
| ---------------------------------------- | ---------------------- |
| :choose-session                          | セッションの切り替え   |
| :rename-session newname                  | セッションの名前を変更 |
| d                                        | セッションをデタッチ   |
| :set-window-option synchronize-panes off | パネルの同期を\_off    |
| \$                                       | セッションの名前変更   |
