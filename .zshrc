# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# nodenv
export PATH="$HOME/.anyenv/envs/nodenv/versions/*/bin:$PATH"

# pyenv
export PATH="$HOME/.anyenv/envs/pyenv/versions/*/bin:$PATH"

# rbenv
export PATH="$HOME/.anyenv/envs/rbenv/versions/*/bin:$PATH"

# Flutter
export PATH="$PATH:$HOME/Program/flutter/bin"

# postresql
export PGDATA=/usr/local/var/postgres

# yarn
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# ===Alias===
# Git
alias cm='(){git commit -m "$1"}'
alias ad='git add'
alias push='git push'
alias pushf='git push -f'
alias pushinit='(){git push --set-upstream origin $1}'
alias pull='git pull'
alias st='git status'
alias log='git log'
alias diff='git diff'
alias reset='git reset'
alias amend='git commit --amend'
alias branch='git branch'
alias cout='git checkout'
alias coutb='git checkout -b'
alias cout-='git checkout -'
alias clone='git clone'
# Docker
alias dc='docker'
alias dce='(){docker-compose exec $1}'
alias dcbash='(){docker-compose exec $1 bash}'
alias dczsh='(){docker-compose exec $1 zsh}'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build'
alias dcrun='docker-compose run'
# Rails
alias be='bundle exec'
alias rd='bin/rails d'
alias rg='bin/rails g'
alias rs='bin/rails s -b 0.0.0.0'
alias rc='bin/rails c'
alias rr='bin/rails routes'
alias rseed='bin/rails db:seed'
alias rdrop='bin/rails db:drop'
alias rrollback='bin/rails db:rollback'
alias rcreate='bin/rails db:create'
alias rmigrate='bin/rails db:migrate'
# Django
alias drun='python manage.py runserver 0.0.0.0:8000'
alias dmakemigrate='python manage.py makemigrations'
alias dmigrate='python manage.py migrate'
alias dsuperuser='python manage.py createsuperuser'
alias dshell='python manage.py shell'
# Npm
alias nr='npm run'
alias nwatch='npm run watch'
alias ninfo='npm info'
alias ni='npm install'
alias npmlistg='npm list --depth=0 -g'

# yarn
alias yr='yarn run'
alias ywatch='yarn run watch'

# Util
alias sa='ssh-add -K'
alias relogin='exec $SHELL -l'


export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"


# 最後にfish起動
exec fish
