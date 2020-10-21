
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \cs 'peco_cd'
end

set GHQ_SELECTOR peco
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g fish_prompt_pwd_dir_length 0

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
alias fishc='cd && vim .config/fish/config.fish'
alias zshc='cd && vim .zshrc'
alias bashc='cd && vim .bashrc'
alias vi='nvim'
alias ls='exa --icons -a'
alias cdnote='cd && cd note'

sa
