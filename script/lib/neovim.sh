#!/bin/bash

# 実行したコマンドを表示
# set -x
set -ue

has() {
  type "$1" > /dev/null 2>&1
}

if ! has "nvim"; then
  # Setup neovim nightly
  case ${OSTYPE} in
    "darwin*" )
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
      tar xzf ~/nvim-macos.tar.gz
      rm -f ~/nvim-macos.tar.gz
      ;;
    "linux-gnu" )
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
      chmod u+x nvim.appimage
      ./nvim.appimage
      ;;
    "*" )
      echo $(tput setaf 1)Working only OSX / Ubuntu!!$(tput sgr0)
      exit 1 ;;
  esac
else
  echo "Neovim has been already installed."
fi
