#!/bin/bash

set -ue # コマンドが1つでもエラーになったらシェルを終了する
OS="$(uname -s)"
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/uki1014/dotfiles/tarball/master"
REMOTE_URL="git@github.com::yucchini/dotfiles.git"

function has() {
  type "$1" > /dev/null 2>&1
}

function usage() {
  name=`basename $0`
  cat << EOF
Usage:
  $name [arguments] [command]
Commands:
  deploy
  initialize
Arguments:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

while getopts :f:h opt; do
  case ${opt} in
    f)
      OVERWRITE=true
      ;;
    h)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

# If missing, download and extract the dotfiles repository
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}

  if has "git"; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

cd ${DOT_DIRECTORY}
source ./setup_symlink.sh
source ./lib/neovim.sh
source ./lib/brew.sh

function initialize() {
  case ${OSTYPE} in
    "darwin*" )
      curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
      tar xzf ~/nvim-macos.tar.gz
      rm -f ~/nvim-macos.tar.gz
      ;;
    "linux-gnu" )
      sudo apt remove neovim
      sudo add-apt-repository ppa:neovim-ppa/unstable
      sudo apt-get update
      sudo apt install neovim/focal
      ;;
    "*" )
      echo $(tput setaf 1)Working only OSX / Ubuntu!!$(tput sgr0)
      exit 1 ;;
  esac

  [ ${SHELL} != "/usr/local/bin/fish"  ] && chsh -s $(which fish)

  if [ ! -d ${HOME}/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
    anyenv install goenv
    anyenv install rbenv
    anyenv install pyenv
    anyenv install nodenv
    exec $SHELL -l

    source ./lib/node.sh
    source ./lib/ruby.sh
    source ./lib/python.sh
  else
    echo "anyenv has been already installed."
  fi

  if [ ! -d ${HOME}/.anyenv/plugins ]; then
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
    anyenv update
  fi

  set +e

  echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"
}

command=$1
[ $# -gt 0 ] && shift

case $command in
  deploy)
    link_files
    ;;
  init*)
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0
