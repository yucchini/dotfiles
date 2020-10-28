## Usage

```shell
$ cd ~/ # if windows use this > cd %HOMEPATH%
$ git clone https://github.com/your_name/dotfiles.git
$ sh dotfilesLink.sh # if windows use this > mklink.bat
```

※ `sh dotfilesLink.sh`を実行する時は既存のシンボリックリンクやファイル位置に注意

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
