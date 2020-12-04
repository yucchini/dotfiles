#! /bin/sh

echo "Installing homebrew..."

if command -v git; then
  echo "brew あるよ"
else
  echo 'ないよ'
fi

# which -s brew
# if [[ $? != 0 ]] ; then
#   yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# else
#   echo "Homebrew already installed ..."
# fi

# which -s fish
# if [[ $? != 0 ]] ; then
#   echo 'already installed fish'
# else
#   echo "Homebrew already installed ..."
# fi

