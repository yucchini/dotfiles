set -xg LC_CTYPE ja_JP.UTF-8
set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8

set -x PATH $PATH $HOME

if status --is-interactive
  # anyenv
  set -x PATH $PATH $HOME/.anyenv/bin
  anyenv init - fish | source

  # nodenv
  set -x PATH $HOME/.anyenv/envs/nodenv/bin $HOME/.anyenv/envs/nodenv/shims $PATH

  # pyenv
  set -x PATH $HOME/.anyenv/envs/pyenv/bin $HOME/.anyenv/envs/pyenv/shims $PATH

  # rbenv（tmuxを使用している場合はtmuxがシステムデフォルトのrubyを見に行ってしまうのであえてPATHを指定する）
  set -x PATH $HOME/.anyenv/envs/rbenv/bin $HOME/.anyenv/envs/rbenv/shims $PATH

  # direnv
  direnv hook fish | source

  # Rust
  # set -x PATH $PATH $HOME/.cargo/bin

  # Go
  set -x GOENV_ROOT "$HOME/.anyenv/envs/goenv"
  set -x PATH $PATH "$GOENV_ROOT/bin"

  command goenv rehash 2>/dev/null
  function goenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      source (goenv "sh-$command" $argv|psub)
    case '*'
      command goenv "$command" $argv
    end
  end

  # いろいろ入れておくところ
  # set -x PATH $PATH $HOME/dotfiles/.bin
  # set -x PATH $PATH $HOME/bin
end

set GHQ_SELECTOR peco
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g fish_prompt_pwd_dir_length 0
# 現在使用しているshell
set using_shell (ps -p %self | tail +2 | awk '{print $NF}')
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \cs 'peco_cd'
end

function attach_tmux_session_if_needed
  set ID (tmux list-sessions)
  if test -z "$ID"
    tmux new-session
    return
  end

  set new_session "Create New Session"
  set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
  if test "$ID" = "$new_session"
    tmux new-session
  else if test -n "$ID"
    tmux attach-session -t "$ID"
  end
end

function ide
  tmux split-window -v -p 21
  tmux split-window -h -p 66
  tmux split-window -h -p 50
end

# macの画面で使う用
function idem
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
end

# macの画面で使う用
function idefm
  tmux split-window -v -p 30
	tmux split-window -h -p 75
	tmux split-window -h -p 66
	tmux split-window -h -p 50
end

function idef
  tmux split-window -v -p 21
  tmux split-window -h -p 75
  tmux split-window -h -p 66
  tmux split-window -h -p 50
end

function idet
  tmux split-window -v -p 21
  tmux split-window -h -p 50
end

function freeeide
  tmux split-window -v -p 30
  tmux split-window -h -p 80
  tmux split-window -h -p 50
  tmux split-window -h -p 40
  tmux split-window -v -p 50
end

# Install fisher
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# fzf settings
set -U FZF_LEGACY_KEYBINDINGS 0

# fish起動時にtmuxを起動
if test -z $TMUX
  # if test $using_shell = '-fish'
  attach_tmux_session_if_needed
  # end
end

# ===Alias===
# Git
alias git='hub'
alias g='git'
alias cm='git commit -m'
alias aad='git add .'
alias ad='git add'
alias pu='git push'
alias pulr='git pull --rebase'
alias puf='git push -f'
alias pui='git push --set-upstream origin'
alias puod='git push origin develop'
alias puom='git push origin master'
alias pul='git pull'
alias puld='git pull upstream develop'
alias pulm='git pull upstream master'
alias st='git status'
alias gl='git log'
alias diff='git diff'
alias diffst='git diff --staged'
alias greset='git reset'
alias amend='git commit --amend'
alias br='git branch'
alias brd='git branch -D'
alias fe='git fetch'
alias cout='git checkout'
alias coutb='git checkout -b'
alias cout-='git checkout -'
alias coutr='git checkout .'
alias clone='git clone'
alias scloned='git clone --branch develop --depth 1'
alias sclonem='git clone --branch master --depth 1'
alias coutd='git checkout develop'
alias fepul='git fetch upstream pull/$argv[1]/head:$argv[2]'
alias ce='gitmoji -c'

# tmux
alias t='tmux'
alias tn='tmux new -s'
alias tls='tmux ls' # セッションの一覧表示
alias tlsc='tmux lsc' # 接続クライアントの一覧表示
alias ta='tmux a'
alias tat='tmux attach -t' # セッションを再開
alias tk='tmux kill-session'
alias tkt='tmux kill-session -t'
alias tks='tmux kill-server' # tmux全体を終了
alias ret='tmux source ~/.tmux.conf'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcp='docker-compose'
alias dps='docker ps'
alias dis='docker images'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build'
alias dcrun='docker-compose run'
alias dprune='docker system prune' # 停止コンテナ、タグ無しイメージ、未使用ボリューム、未使用ネットワーク一括削除
alias diprune='docker image prune' # 未使用イメージ一括削除
alias dvprune='docker volume prune' # 未使用ボリューム一括削除
alias dnprune='docker network prune' # 未使用ネットワーク一括削除

# Rails
alias b='bundle'
alias be='bundle exec'
alias rd='bin/rails d'
alias rg='bin/rails g'
alias rs='bin/rails s -b 0.0.0.0'
alias rc='bin/rails c'
alias rr='bin/rails routes'
alias rseed='bin/rails db:seed'
alias rdrop='bin/rails db:drop'
alias rroll='bin/rails db:rollback'
alias rcr='bin/rails db:create'
alias rmi='bin/rails db:migrate'
alias resque='QUEUE=* bundle exec rake resque:work'

# Django
alias prun='python manage.py runserver 0.0.0.0:8000'
alias pmmi='python manage.py makemigrations'
alias pmi='python manage.py migrate'
alias pcsu='python manage.py createsuperuser'
alias psh='python manage.py shell'

# Npm
alias nr='npm run'
alias nw='npm run watch'
alias nsb='npm run storybook'
alias nc='npm run clean'
alias ninfo='npm info'
alias ni='npm install'
alias nui='npm uninstall'
alias nci='npm ci'
alias npmlistg='npm list --depth=0 -g'

# yarn
alias ya='yarn add'
alias yr='yarn run'
alias yw='yarn run watch'
alias ysb='yarn run storybook'
alias yc='yarn run clean'

# Util
alias sa='ssh-add -K'
alias rel='exec $SHELL -l'
alias ressh='sudo launchctl stop com.openssh.sshd'
alias bashc='nvim ~/dotfiles/.bashrc'
alias zshrc='nvim ~/dotfiles/.zshrc'
alias fishc='nvim ~/dotfiles/fish/config.fish'
alias tmuxc='nvim ~/dotfiles/.tmux.conf'
alias vimc='nvim ~/dotfiles/.vimrc'
alias vimkey='nvim ~/dotfiles/.maps.vimrc'
alias cdd='cd ~/dotfiles/'
alias vim='nvim'
alias vi='nvim'
# カレントディレクトリを指定した場合はDefxを起動させるために下記のファイルを同時に読み込む
alias v='nvim . -S ~/.config/nvim/plugins/defx.start.rc.vim'
alias ls='exa --icons -a'
alias lsl='exa -1 --icons -a'
alias cdnote='cd ~/note'
alias cdynote='cd ~/../yucchini/note'
alias vs='code .'
alias lslink='ls -la | grep "\->"'
alias lg='ls | grep'
alias c='clear'
alias sshc='nvim ~/.ssh/config'
alias ..="cd .."
alias ...='cd ../../'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rmr='rm -r'
alias python3='python3.8'
alias shell='echo $SHELL'
alias p='pwd'

if [ -d ~/dotfiles/freee ]
	echo 'source freee.config.fish!'
  source ~/dotfiles/freee/freee.config.fish
end

# 毎回やるの面倒なので起動時にssh-add -K
sa
