function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \cc 'peco_cd'
end

set GHQ_SELECTOR peco
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g fish_prompt_pwd_dir_length 0

# ===Alias===
# Git
alias gc='git commit -m'
alias ga='git add'
alias push='git push'
alias pushf='git push -f'
alias pushinit='git push --set-upstream origin'
alias pull='git pull'
alias gs='git status'
alias gl='git log'
alias diff='git diff'
alias reset='git reset'
alias amend='git commit --amend'
alias branch='git branch'
alias cout='git checkout'
alias coutb='git checkout -b'
alias cout-='git checkout -'
alias clone='git clone'
alias gr='git browse-remote'

# Docker
alias dc='docker'
alias dps='docker ps'
alias dce='docker-compose exec'
alias dcbash='docker-compose exec $argv[1] bash'
alias dczsh='docker-compose exec $argv[1] zsh'
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
alias superuser='python manage.py createsuperuser'
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
