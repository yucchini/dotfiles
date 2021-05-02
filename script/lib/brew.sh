#!/bin/bash

set -ue

has() {
  type "$1" > /dev/null 2>&1
}

target_brew_list=(
  ag
  ripgrep
  peco
  ghq
  tmux
  tig
  hub
  lazygit
  pyenv-virtualenv
  jq
  fzf
  bat
  git-flow
  gitmoji
  git
  tree
  direnv
)

if ! has "brew"; then
  echo "Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew has been already installed."
fi

brew update
brew upgrade

for target in ${target_brew_list[@]}; do
  if ! has "$target"; then
    brew install $target
  else
    echo "$target has been already installed."
  fi
done

