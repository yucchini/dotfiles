set -xg LC_CTYPE ja_JP.UTF-8
set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8
set -x PATH $HOME/.anyenv/bin $PATH
eval anyenv init - fish | source
set PATH $HOME/.local/bin $PATH
set GHQ_SELECTOR peco
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g fish_prompt_pwd_dir_length 0
# 現在使用しているshell
set using_shell (ps -p %self | tail +2 | awk '{print $NF}')

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

# fish起動時にtmuxを起動
if test -z $TMUX
  if test $using_shell = 'fish'
    attach_tmux_session_if_needed
  end
end

# ===Alias===
# Git
alias cm='git commit -m'
alias ad='git add'
alias pu='git push'
alias puf='git push -f'
alias pui='git push --set-upstream origin'
alias pul='git pull'
alias puld='git pull pr develop'
alias st='git status'
alias gl='git log'
alias diff='git diff'
alias gr='git reset'
alias ga='git commit --amend'
alias gb='git branch'
alias ct='git checkout'
alias ctb='git checkout -b'
alias ctm='git checkout -'
alias clone='git clone'
alias ctd='git checkout develop'

# tmux
alias t='tmux'
alias tn='tmux new -s'
alias tls='tmux ls' # セッションの一覧表示
alias tlsc='tmux lsc' # 接続クライアントの一覧表示
alias ta='tmux attach -t' # セッションを再開
alias tk='tmux kill-session'
alias tkt='tmux kill-session -t'
alias tks='tmux kill-server' # tmux全体を終了

# Docker
alias dc='docker'
alias dce='docker-compose exec'
alias dcp='docker-compose'
alias dps='docker ps'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build'
alias dcrun='docker-compose run'
alias dprune='docker system prune' # 停止コンテナ、タグ無しイメージ、未使用ボリューム、未使用ネットワーク一括削除
alias diprune='docker image prune' # 未使用イメージ一括削除
alias dvprune='docker volume prune' # 未使用ボリューム一括削除
alias dnprune='docker network prune' # 未使用ネットワーク一括削除

# Rails
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

# Django
alias prun='python manage.py runserver 0.0.0.0:8000'
alias pmmi='python manage.py makemigrations'
alias pmi='python manage.py migrate'
alias pcsu='python manage.py createsuperuser'
alias psh='python manage.py shell'

# Npm
alias nr='npm run'
alias yr='yarn run'
alias nw='npm run watch'
alias yw='yarn run watch'
alias stb='npm run storybook'
alias ninfo='npm info'
alias ni='npm install'
alias nci='npm ci'
alias npmlistg='npm list --depth=0 -g'

# yarn
alias yr='yarn run'
alias yw='yarn run watch'

# Util
alias sa='ssh-add -K'
alias rel='exec $SHELL -l'
alias ressh='sudo launchctl stop com.openssh.sshd'
alias bashc='cd && nvim ~/dotfiles/.bashrc'
alias zshrc='cd && nvim ~/dotfiles/.zshrc'
alias fishc='cd && nvim ~/dotfiles/fish/config.fish'
alias vi='nvim'
alias ls='exa --icons -a'
alias cdnote='cd && cd note'
alias vs='code .'
alias lslink='ls -la | grep "\->"'

if [ -d ~/dotfiles/freee ]
	echo 'source freee.config.fish!'
  source ~/dotfiles/freee/freee.config.fish
end

# 毎回やるの面倒なので起動時にssh-add -K
sa
