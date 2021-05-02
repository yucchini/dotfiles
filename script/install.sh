#! /bin/sh

set -ue

function help_message() {
  command echo "Usage: $0 [--help | h]" 0>&2
  command echo ""
}

function link_to_root() {
  command echo "backup old dotfiles..."
  if [! -d "$HOME/dotbackup"];then
    command echo "$HOME/dotbackup not found. Auto make it."
    command mkdir "$HOME/dotbackup"
  fi

  local script_dir = "$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd -P)"
  local dot_dir = $(dirname ${script_dir})

  if [[ "$HOME" != "$dot_dir" ]];then
    for f in $dot_dir/.??*; do
      [[ `basename $f` == ".git" ]] && countinue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -rf "$HOME/`basename $f`"
      fi

      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}


function main() {
  # while [ $# -gt 0 ];do
  #   case ${1} in
  #     --debug|-d)
  #       set -uex
  #       ;;
  #     --help|-h)
  #       help_message
  #       exit 1
  #       ;;
  #     *)
  #       ;;
  #   esac
  #   shift
  # done

  # link_to_root
  # git config --global include.path "~/.gitignore_global"

  help_message
}

main
