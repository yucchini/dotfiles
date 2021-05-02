#!/bin/bash

RUBY_LATEST_LTS_VERSION=2.7.2

has() {
  type "$1" > /dev/null 2>&1
}

target_global_ruby_packages=(
  neovim
)

if has "rbenv"; then
  if [[ -d "${RBENV_ROOT}/versions/${RUBY_LATEST_LTS_VERSION}"  ]]; then
    echo "ruby: $RUBY_LATEST_LTS_VERSION has been already installed."
  else
    rbenv install $RUBY_LATEST_LTS_VERSION
    rbenv global $RUBY_LATEST_LTS_VERSION
    rbenv rehash
  fi

  eval "$(rbenv init -)"
  for target in ${target_global_ruby_packages[@]}; do
    echo "Installing $target..."
    gem install -g $target
  done

else
  echo "Ruby is not installed."
fi
